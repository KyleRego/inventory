# frozen_string_literal: true

require "rails_helper"

RSpec.describe Item do
  context "associations" do
    subject(:item) do
      Item.new
    end

    it { should belong_to(:item).class_name("Item").optional }
  end
end