class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.text :notes
      t.references :item, null: false, foreign_key: true
      t.boolean :container
      t.float :weight
      t.references :location, null: false, foreign_key: true

      t.timestamps
    end
  end
end
