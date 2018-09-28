class RateableAttributesController < ApplicationController
  before_action :set_rateable_attribute, only: [:show, :edit, :update, :destroy]

  # GET /rateable_attributes
  def index
    @rateable_attributes = RateableAttribute.order(:title).all
  end

  # GET /rateable_attributes/1
  def show
  end

  # GET /rateable_attributes/new
  def new
    @form = RateableAttributeForm.new(RateableAttribute.new)
  end

  # GET /rateable_attributes/1/edit
  def edit
    @form = RateableAttributeForm.new(@rateable_attribute)
    @form.prepopulate!
  end

  # POST /rateable_attributes
  def create
    @form = RateableAttributeForm.new(RateableAttribute.new)
    if @form.validate(rateable_attribute_params)
      @form.save
      redirect_to @form.model, notice: 'Attribute was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /rateable_attributes/1
  def update
    @form = RateableAttributeForm.new(@rateable_attribute)
    p rateable_attribute_params
    if @form.validate(rateable_attribute_params)
      @form.save
      redirect_to @form.model, notice: 'Attribute was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /rateable_attributes/1
  def destroy
    @rateable_attribute.destroy
    redirect_to rateable_attributes_url, notice: 'Attribute was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_rateable_attribute
    @rateable_attribute = RateableAttribute.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def rateable_attribute_params
    params.require(:rateable_attribute).permit(:title, location_ids: [])
  end
end
