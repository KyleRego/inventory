# frozen_string_literal: true

require "rails_helper"

RSpec.describe "DELETE /items/:id", "#destroy" do
  subject(:delete_items_destroy) do
    delete item_path(item)
  end

  let!(:item) { create(:item, container: is_inventory) }
  let(:is_inventory) { false }

  it "deletes the item" do
    expect { delete_items_destroy }.to change(Item, :count).by(-1)
    expect(flash[:notice]).to eq "Item was successfully deleted."
  end

  context "when deleting an inventory with contained items" do
    let(:is_inventory) { true }

    let!(:contained_item) do
      create(:item, item: item)
    end

    it "deletes the inventory and does not delete the contained items" do
      expect { delete_items_destroy }.to change(Item, :count).by(-1)

      expect(contained_item.reload.item).to be_nil
      expect(flash[:notice]).to eq "Item was successfully deleted."
    end
  end
end
