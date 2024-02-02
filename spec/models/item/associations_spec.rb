# frozen_string_literal: true

require "rails_helper"

RSpec.describe Item do
  subject(:item) { Item.new }

  it { should belong_to(:item).class_name("Item").optional }

  it { should have_many(:items).dependent(:nullify) }

  it { should belong_to(:location).class_name("Location").optional }
end
