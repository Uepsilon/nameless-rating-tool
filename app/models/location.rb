class Location < ApplicationRecord
  has_many :visits
  has_many :visitors, class_name: 'visiting_users', through: :visits
  has_many :users, through: :visitors

  has_many :location_rateable_attributes
  has_many :rateable_attributes, through: :location_rateable_attributes

  def latitude
    lonlat&.x
  end

  def longitude
    lonlat&.y
  end
end
