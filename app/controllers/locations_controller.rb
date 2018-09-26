class LocationsController < ApplicationController
  before_action :set_location, only: %i(show edit update destroy)

  # GET /locations
  def index
    @locations = Location.all
  end

  # GET /locations/1
  def show
  end

  # GET /locations/new
  def new
    @location = Location.new
  end

  # GET /locations/1/edit
  def edit
  end

  # POST /locations
  def create
    @location = Location.new(location_params)

    if @location.save
      redirect_to @location, notice: 'Location was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /locations/1
  def update
    if @location.update(location_params)
      redirect_to @location, notice: 'Location was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /locations/1
  def destroy
    @location.destroy
    redirect_to locations_url, notice: 'Location was successfully destroyed.'
  end

  def places_search
    @places = places_client.spots_by_query(search_params, types: %w[restaurants, food])
  end

  def place_details
    @place = places_client.spot(details_params)
  end

  private

  def places_client
    @api_client ||= GooglePlaces::Client.new(Rails.application.credentials.google[:api_key])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_location
    @location = Location.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def location_params
    params.require(:location).permit(:name, :place_id, :street, :street_number, :zip_code, :city, :phone_number, :website, :latitude, :longitude)
  end

  def search_params
    params.require(:q)
  end

  def details_params
    params.require(:place_id)
  end
end