FactoryGirl.define do
  factory :place do
    name TubularFaker.name
    phone_number Faker::PhoneNumber.phone_number
    address Faker::Address.street_address + TubularFaker.city
  end
end
