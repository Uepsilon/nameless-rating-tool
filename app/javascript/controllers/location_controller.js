import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ 'searchResult', 'name', 'placeId', 'street', 'streetNumber', 'zipCode', 'city', 'phoneNumber', 'website', 'latitude', 'longitude' ]

  connect() {
    let searchTimeout = null
    let lastQuery = null
    let results = []
  }

  searchLocation = event => {
    clearTimeout(this.searchTimeout)
    this.searchTimeout = setTimeout(() => {
      const query = this.trimQuery(event.srcElement.value)
      if (query.length <= 3 || this.lastQuery == query)
        return

      this.searchResultTarget.innerHTML = ''
      this.search(query)
    }, 300)
  }

  autoFillPlace = event => {
    const placeId = event.srcElement.getAttribute('data-placeId')
    const requestOptions = {
      headers: {
        'Accept': 'application/json'
      }
    }

    fetch(`/locations/place_details?place_id=${placeId}`, requestOptions)
      .then(response => response.json())
      .then(json => {
        this.nameTarget.value = json.name
        this.placeIdTarget.value = json.place_id
        this.streetTarget.value = json.street
        this.streetNumberTarget.value = json.street_number
        this.zipCodeTarget.value = json.postal_code
        this.cityTarget.value = json.city
        this.phoneNumberTarget.value = json.international_phone_number
        this.websiteTarget.value = json.website
        this.latitudeTarget.value = json.lat
        this.longitudeTarget.value = json.lng
      })
  }

  trimQuery = query =>
    query.trim().toLowerCase()

  search = locationName => {
    const requestOptions = {
      headers: {
        'Accept': 'application/json'
      }
    }

    fetch(`/locations/places_search?q=${locationName}`, requestOptions)
      .then(response => response.json())
      .then(json => {
        this.processPlaces(locationName, json)
        this.displaySearchResults()
      })
  }

  processPlaces = (searchQuery, { places = [] }) => {
    let results = {}

    places.forEach(place => {
      results = {
        ...results,
        [place.place_id]: place
      }
    })

    this.lastQuery = searchQuery
    this.results = results
  }

  displaySearchResults = () => {
    const resultView = document.createElement('ul')
    resultView.id = 'places-search-results'

    Object.keys(this.results).forEach(placeId => {
      const place = this.results[placeId]
      const resultRow = document.createElement('li')

      resultRow.class = 'places-search-result-row'
      resultRow.innerText = `${place.name} - ${place.formatted_address}`
      resultRow.setAttribute('data-placeId', placeId)
      resultRow.setAttribute('data-action', 'click->location#autoFillPlace')
      resultView.appendChild(resultRow)
    })

    this.searchResultTarget.innerHTML = resultView.outerHTML
  }
}
