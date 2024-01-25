# frozen_string_literal: true

require "rails_helper"

RSpec.describe Item do
  subject(:item) { Item.new }

  it { should belong_to(:item).class_name("Item").optional }
end
