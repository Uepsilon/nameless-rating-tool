import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ 'placesSearchBox', 'searchResult', 'name', 'placeId', 'street', 'streetNumber', 'zipCode', 'city', 'country', 'phoneNumber', 'website', 'latitude', 'longitude' ]

  connect() {
    let searchTimeout = null
    let lastQuery = null
  }

  searchLocation = event => {
    clearTimeout(this.searchTimeout)
    this.searchTimeout = setTimeout(() => {
      const srcElement = event.srcElement
      const query = this.trimQuery(srcElement.value)
      if (query.length <= 3 || this.lastQuery == query)
        return

      this.searchResultTarget.innerHTML = ''
      srcElement.parentElement.classList.add('is-loading')
      srcElement.setAttribute('readonly', true)
      this.search(query, srcElement)
        .then(() => {
          srcElement.removeAttribute('readonly')
          srcElement.parentElement.classList.remove('is-loading')
          srcElement.focus()
        })
    }, 300)
  }

  autoFillPlace = event => {
    const placeId = event.currentTarget.getAttribute('data-place-id')
    event.currentTarget.classList.add('is-selected')
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
        this.countryTarget.value = json.country
        this.phoneNumberTarget.value = json.international_phone_number
        this.websiteTarget.value = json.website
        this.latitudeTarget.value = json.lat
        this.longitudeTarget.value = json.lng
      })
  }

  trimQuery = query =>
    query.trim().toLowerCase()

  search = locationName => {
    return fetch(`/locations/places_search?q=${locationName}`)
      .then(response => response.text())
      .then(resultHtml => {
        this.lastQuery = locationName
        this.searchResultTarget.innerHTML = resultHtml
      })
  }
}
