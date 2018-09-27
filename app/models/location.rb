class Location < ApplicationRecord
  has_many :visits
  has_many :users, through: :visits

  def latitude
    lonlat&.x
  end

  def longitude
    lonlat&.y
  end
end
