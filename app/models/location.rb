class Location < ApplicationRecord
  has_many :visits
  has_many :users, through: :visits

  attr_accessor :latitude, :longitude

  validates :name, presence: true
  validates :place_id, presence: true, uniqueness: true
  validates :street, presence: true
  validates :street_number, presence: true
  validates :zip_code, presence: true
  validates :city, presence: true

  before_save :update_lonlat

  def latitude
    @latitude || lonlat&.x
  end

  def longitude
    @longitude || lonlat&.y
  end

  private

  def update_lonlat
    self.lonlat = "POINT(#{latitude} #{longitude})"
  end

end
