class RateableAttributesController < ApplicationController
  before_action :set_rateable_attribute, only: [:show, :edit, :update, :destroy]

  # GET /rateable_attributes
  # GET /rateable_attributes.json
  def index
    @rateable_attributes = RateableAttribute.all
  end

  # GET /rateable_attributes/1
  # GET /rateable_attributes/1.json
  def show
  end

  # GET /rateable_attributes/new
  def new
    @rateable_attribute = RateableAttribute.new
  end

  # GET /rateable_attributes/1/edit
  def edit
  end

  # POST /rateable_attributes
  # POST /rateable_attributes.json
  def create
    @rateable_attribute = RateableAttribute.new(rateable_attribute_params)

    respond_to do |format|
      if @rateable_attribute.save
        format.html { redirect_to @rateable_attribute, notice: 'Rateable attribute was successfully created.' }
        format.json { render :show, status: :created, location: @rateable_attribute }
      else
        format.html { render :new }
        format.json { render json: @rateable_attribute.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rateable_attributes/1
  # PATCH/PUT /rateable_attributes/1.json
  def update
    respond_to do |format|
      if @rateable_attribute.update(rateable_attribute_params)
        format.html { redirect_to @rateable_attribute, notice: 'Rateable attribute was successfully updated.' }
        format.json { render :show, status: :ok, location: @rateable_attribute }
      else
        format.html { render :edit }
        format.json { render json: @rateable_attribute.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rateable_attributes/1
  # DELETE /rateable_attributes/1.json
  def destroy
    @rateable_attribute.destroy
    respond_to do |format|
      format.html { redirect_to rateable_attributes_url, notice: 'Rateable attribute was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rateable_attribute
      @rateable_attribute = RateableAttribute.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rateable_attribute_params
      params.fetch(:rateable_attribute, {})
    end
end
