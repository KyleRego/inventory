class MakeItemsNameNotNullable < ActiveRecord::Migration[7.0]
  def change
    change_column_null :items, :name, false
  end
end
