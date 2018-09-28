# frozen_string_literal: true

FactoryBot.define do
  factory :location do
    name { 'FooBar' }
    sequence(:place_id) { |i| "foo-bar-#{i}" }
    street { 'FooStreet' }
    street_number { '1a' }
    zip_code { 12_345 }
    city { 'FooCity' }
    phone_number
    website
    lonlat
  end
end
