class MakeItemContainerDefaultFalse < ActiveRecord::Migration[7.0]
  def change
    change_column :items, :container, :boolean, default: false
  end
end
