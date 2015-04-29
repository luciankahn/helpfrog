require 'rails_helper'

Rspec.feature "Results", js: true, type: :feature do

  scenario "Map appears after user submits form with address and checked categories" do

    # seed test database with:
    # 3 dummy categories
    # 3 places in each category, with New York latitude/longitudes.

    # Need to Emulate:
    # an address is entered in the input on the form ( # dummy input address in New York)
    # 2 categories on the form are clicked
    # the user clicks the submit button

  end
end
