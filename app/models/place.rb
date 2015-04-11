class Place < ActiveRecord::Base
  extend Geocoder::Model::ActiveRecord
  geocoded_by :address

  validates :name, presence: true
  validates :category, presence: true
  validates :address, presence: true
  validates :latitude, presence: true, numericality: true
  validates :longitude, presence: true, numericality: true

end
