class ChangeSomeItemsColumnsToBeNullable < ActiveRecord::Migration[7.0]
  def change
    change_column_null :items, :location_id, true
    change_column_null :items, :item_id, true
  end
end
