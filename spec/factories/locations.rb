# frozen_string_literal: true

FactoryBot.define do
  factory :location do
    name { "Name of the location" }
    description { "A nice description of this location" }
  end
end