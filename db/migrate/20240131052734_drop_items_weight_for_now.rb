class DropItemsWeightForNow < ActiveRecord::Migration[7.0]
  def change
    remove_column :items, :weight
  end
end
