class LocationForm < Reform::Form
  property :name
  property :place_id
  property :street
  property :street_number
  property :zip_code
  property :city
  property :phone_number
  property :website
  property :lonlat
  property :latitude, virtual: true, prepopulator: -> (options) { self.latitude = model.latitude }
  property :longitude, virtual: true, prepopulator: -> (options) { self.longitude = model.longitude }

  validates :name, presence: true
  validates :place_id, presence: true
  validates :street, presence: true
  validates :street_number, presence: true
  validates :zip_code, presence: true
  validates :city, presence: true

  validates_uniqueness_of :place_id

  def save
    update_lonlat
    super
  end

  def update_lonlat
    self.lonlat = "POINT(#{latitude} #{longitude})"
  end
end
