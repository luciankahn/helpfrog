require "capybara/rails"
require "capybara/rspec"
require "capybara/poltergeist" # Add this line to require poltergeist

Capybara.javascript_driver = :poltergeist
