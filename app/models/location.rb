# frozen_string_literal: true

class Location < ApplicationRecord
  has_many :items, dependent: :nullify

  has_one_attached :picture
end
