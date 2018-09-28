class RateableAttributeForm < Reform::Form
  property :title
  property :location_ids

  validates :title, presence: true
  validates_uniqueness_of :title
end
