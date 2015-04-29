require "rails_helper"
require "factory_girl_rails"
require "tubular-faker"

RSpec.feature "Results", js: true, type: :feature do

  scenario "Map appears after user submits form with address and checked categories" do

    category_1 = FactoryGirl.create(:category, name: "teapot")
    category_2 = FactoryGirl.create(:category, name: "tea kettle")
    category_3 = FactoryGirl.create(:category, name: "french press")

    addresses = ["Broadway and Wall Street, New York, NY",
      "11 Wall Street, New York, NY",
      "14 Wall Street, New York, NY",
      "66 Wall St., New York, NY",
      "26 East Broadway, New York, NY",
      "Broadway and Beaver Street, New York, NY",
      "48 Wall St., New York, NY",
      "50 Wall St., New York, NY",
      "80 Wall St., New York, NY"]

    category_1.places << FactoryGirl.create(:place, address: addresses[0])
    # category_1.places << FactoryGirl.create(:place, address: addresses[1])
    # category_1.places << FactoryGirl.create(:place, address: addresses[2])

    # category_2.places << FactoryGirl.create(:place, address: addresses[3])
    # category_2.places << FactoryGirl.create(:place, address: addresses[4])
    # category_2.places << FactoryGirl.create(:place, address: addresses[5])

    # category_3.places << FactoryGirl.create(:place, address: addresses[6])
    # category_3.places << FactoryGirl.create(:place, address: addresses[7])
    # category_3.places << FactoryGirl.create(:place, address: addresses[8])

    p category_1
    # p category_1.places
    # Need to Emulate:
    # an address is entered in the input on the form ( # dummy input address in New York)
    # 2 categories on the form are clicked
    # the user clicks the submit button

  end
end
