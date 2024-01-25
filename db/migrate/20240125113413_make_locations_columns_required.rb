class MakeLocationsColumnsRequired < ActiveRecord::Migration[7.0]
  def change
    change_column_null :locations, :name, false
    change_column_null :locations, :description, false
  end
end
