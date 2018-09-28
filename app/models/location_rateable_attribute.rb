class LocationRateableAttribute < ApplicationRecord
  belongs_to :location
  belongs_to :rateable_attribute
end
