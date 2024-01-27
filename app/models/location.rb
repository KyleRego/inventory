# frozen_string_literal: true

class Location < ApplicationRecord
  has_many :items, dependent: :nullify
end
