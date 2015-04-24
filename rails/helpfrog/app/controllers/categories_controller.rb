class CategoriesController < ApplicationController
  def index
    @categories = Categories.all
  end
end
