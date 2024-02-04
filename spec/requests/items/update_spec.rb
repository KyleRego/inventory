# frozen_string_literal: true

require "rails_helper"

RSpec.describe "PATCH /items/:id", "#update" do
  subject(:patch_update) do
    patch item_path(item), params:
  end

  let(:params) do
    { item: { name: new_name,
              description: new_description,
              notes: new_notes,
              item_id: new_item_id,
              container: new_container_bool,
              location_id: new_location_id }
    }
  end

  let(:item) { create(:item, container: is_inventory) }
  let(:is_inventory) { false }

  let(:new_name) { "A new name" }
  let(:new_description) { "A new description" }
  let(:new_notes) { "New notes" }
  let(:new_item_id) { nil }
  let(:new_container_bool) { true }
  let(:new_location_id) { nil }

  it "updates the item" do
    patch_update

    expect(item.reload.name).to eq(new_name)
    expect(item.description).to eq(new_description)
    expect(item.notes).to eq(new_notes)
    expect(item.container).to eq(new_container_bool)
    expect(flash[:notice]).to eq "Item was successfully updated."
  end

  context "when updating an inventory to not be an inventory" do
    let(:is_inventory) { true }
    let(:new_container_bool) { false }

    let!(:contained_item) do
      create(:item, item: item)
    end

    it "updates the contained items to no longer belong to the item" do
      patch_update

      expect(contained_item.reload.item).to be_nil
      expect(flash[:notice]).to eq "Item was successfully updated. Any contained items were removed."
    end
  end
end
