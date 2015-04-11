class Place < ActiveRecord::Base
  geocoded_by :address
  # before_save :api_call

  validates :name, presence: true
  validates :category, presence: true
  validates :address, presence: true
  validates :latitude, presence: true, numericality: true
  validates :longitude, presence: true, numericality: true


  # def api_call

  # end

end
