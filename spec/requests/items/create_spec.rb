# frozen_string_literal: true

require "rails_helper"

RSpec.describe "POST /items", "#create" do
  subject(:post_create) do
    post items_path, params:
  end

  let(:params) do
    { item: { name:, description:, notes:, item_id:, container:, location_id: } }
  end

  let(:name) { "name of item" }
  let(:description) { "description of item" }
  let(:notes) { "some notes about the item" }
  let(:item_id) { nil }
  let(:container) { false }
  let(:location_id) { nil }

  it "creates an item" do
    expect { post_create }.to change(Item, :count).by(1)
  end
end
