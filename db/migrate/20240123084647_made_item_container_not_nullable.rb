class MadeItemContainerNotNullable < ActiveRecord::Migration[7.0]
  def change
    change_column_null :items, :container, false
  end
end
