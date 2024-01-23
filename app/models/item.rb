# frozen_string_literal: true

class Item < ApplicationRecord
  belongs_to :item, optional: true
  belongs_to :location, optional: true
end
