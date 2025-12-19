class CreateProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :color
      t.string :storage
      t.integer :battery_percentage
      t.integer :condition
      t.integer :status
      t.decimal :price
      t.text :description
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
