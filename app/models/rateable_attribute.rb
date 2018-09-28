class RateableAttribute < ApplicationRecord
  has_many :location_rateable_attributes
  has_many :locations, through: :location_rateable_attributes

  has_many :reviews
end
