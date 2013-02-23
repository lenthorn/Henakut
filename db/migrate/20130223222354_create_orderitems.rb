class CreateOrderitems < ActiveRecord::Migration
  def change
    create_table :orderitems do |t|
      t.integer :item_id
      t.string :title
      t.text :description
      t.integer :quantity
      t.decimal :price
      t.references :order

      t.timestamps
    end
    add_index :orderitems, :order_id
  end
end
