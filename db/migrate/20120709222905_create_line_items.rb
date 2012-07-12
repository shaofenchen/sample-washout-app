class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
	  t.references :order
	  t.references :product
	  t.decimal :tax, :precision => 8, :scale => 2, :default => 0
	  t.decimal	:price, :precision => 8, :scale => 2, :default => 0
	  t.decimal	:total, :precision => 8, :scale => 2, :default => 0
	  t.integer :quantity
	  t.string :sku
	  t.string :link
	  
      t.timestamps
    end
	add_index :line_items, :order_id
	add_index :line_items, :product_id
  end
end
