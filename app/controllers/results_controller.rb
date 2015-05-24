class ResultsController < ApplicationController

  def show
    if params['address'] == ""
      @address = "14th St. and 3rd Ave., New York, NY"
    else
      @address = params['address']
    end
    if params['filter'] == ""
      filter_categories = Category.all.name
    else
      @filter_categories = params['filter']
    end
    @places = Place.find_places_near(@address, @filter_categories)
    respond_to do |format|
      format.html {} # RESTful conventions take care of rendering this
      format.json {
        render json: custom_json_for(@places)
      }
    end
  end

  private

  def custom_json_for(places)
    lat_longs = []
    places.each do |place|
      lat_longs << [place.latitude, place.longitude, place.name, place.id]
    end
    lat_longs.to_json
  end

end
