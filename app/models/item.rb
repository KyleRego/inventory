# frozen_string_literal: true

class Item < ApplicationRecord
  belongs_to :item, optional: true
  belongs_to :location, optional: true

  has_many :items, dependent: :nullify

  has_one_attached :picture
end
