class Place < ActiveRecord::Base
  extend Geocoder::Model::ActiveRecord
  geocoded_by :address
  has_many :comments
  has_many :place_categories
  has_many :categories, through: :place_categories

  attr_accessible :name, :address, :phone_number, :latitude, :longitude, :description

  validates :name, presence: true
  validates :address, presence: true
  validates :latitude, presence: true, numericality: true
  validates :longitude, presence: true, numericality: true

  before_validation :check_or_assign_lat_longs

  def self.find_places_near(address, filter_categories)
    self.joins(:categories).near(address).where("categories.name IN (?)", filter_categories).limit(30)
  end

  def lat_longs?
    if self.latitude && self.longitude
      true
    else
      false
    end
  end

  def check_or_assign_lat_longs
    unless self.lat_longs?
      self.geocode
      sleep 0.25 # avoid geocode rate limit
    end
  end
end
