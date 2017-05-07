class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :sku
      t.string :title
      t.decimal :price
      t.boolean :active
      t.text :description

      t.timestamps
    end
  end
end
