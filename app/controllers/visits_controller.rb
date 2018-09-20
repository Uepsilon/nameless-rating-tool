class VisitsController < ApplicationController
  before_action :load_location
  before_action :load_users, only: %i(new edit create update)
  before_action :set_visit, only: [:show, :edit, :update, :destroy]

  # GET /visits
  def index
    @visits = Visit.all
  end

  # GET /visits/1
  def show
  end

  # GET /visits/new
  def new
    @visit = Visit.new(location: @location)
  end

  # GET /visits/1/edit
  def edit
  end

  # POST /visits
  def create
    @visit = Visit.new(visit_params.merge(location: @location))
    @visit.visitors = visitors

    require 'pry'; binding.pry

    if @visit.save
      redirect_to [@location, @visit], notice: 'Visit was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /visits/1
  def update
    if @visit.update(visit_params)
      redirect_to @visit, notice: 'Visit was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /visits/1
  def destroy
    @visit.destroy
    redirect_to visits_url, notice: 'Visit was successfully destroyed.'
  end

  private

  def load_location
    @location = Location.find(params[:location_id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_visit
    @visit = Visit.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def visit_params
    params.require(:visit).permit(:location_id, :visited_at)
  end

  def visitors
    User.where(id: params.require(:visit).fetch(:user_ids, []))
  end

  def load_users
    @users = User.all
  end
end
