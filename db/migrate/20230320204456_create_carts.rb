class CreateCarts < ActiveRecord::Migration[7.0]
  def change
    create_table :carts do |t|
      t.integer :total, null: false
      t.json :products, null: false

      t.timestamps
    end
  end
end
