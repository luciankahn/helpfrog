class Place < ActiveRecord::Base
  geocoded_by :address
  before_save :api_call('https://data.cityofnewyork.us/resource/ujsc-un6m.json')

  validates :name, presence: true
  validates :category, presence: true
  validates :address, presence: true
  validates :latitude, presence: true, numericality: true
  validates :longitude, presence: true, numericality: true

  def self.api_call(resource_url)
    http_response = open(resource_url)
    resource = JSON.parse(http_response.read)
  end

  def self.assign_homeless_resources

  end

end
