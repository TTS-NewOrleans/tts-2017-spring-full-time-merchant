class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price
      t.integer :quantity
      t.text :description
      t.references :brand, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
