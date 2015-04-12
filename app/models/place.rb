class Place < ActiveRecord::Base
  extend Geocoder::Model::ActiveRecord
  geocoded_by :address
  has_many :comments
  has_many :place_categories
  has_many :categories, through: :place_categories

  validates :name, presence: true
  validates :address, presence: true
  validates :latitude, presence: true, numericality: true
  validates :longitude, presence: true, numericality: true

end
