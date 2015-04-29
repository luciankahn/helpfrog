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

  def method_name

  end
end
