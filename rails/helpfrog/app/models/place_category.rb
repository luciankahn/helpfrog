class PlaceCategory < ActiveRecord::Base
  belongs_to :place
  belongs_to :category

  # attr_accessible :place_id, :category_id
end
