# frozen_string_literal: true

FactoryBot.define do
  factory :item do
    name { "Name of the item" }
    description { "A nice description of this item" }
    notes { "Some additional notes separate from the description" }
    container { false }
    item { nil }
    location { nil }
  end
end