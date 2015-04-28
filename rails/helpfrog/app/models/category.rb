class Category < ActiveRecord::Base
  has_many :place_categories
  has_many :places, through: :place_categories

  attr_accessible :name

  validates :name, presence: true
end