class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :buyer
      t.string :buyer_email
      t.string :buyer_name
      t.string :order_number
	  t.string :platform
	  t.datetime :order_date
	  t.decimal :tax, :precision => 8, :scale => 2, :default => 0
	  t.decimal	:sales_price, :precision => 8, :scale => 2, :default => 0
	  t.decimal	:total, :precision => 8, :scale => 2, :default => 0
	  t.string :status
	  t.text :notes
	  
	  t.string :shipping_method
	  t.string :address1
	  t.string :address2
	  t.string :address3
	  t.string :city
	  t.string :state
	  t.string :zip_code
	  t.string :country
	  t.string :phone
	  t.datetime :ship_date
	  t.string :carrier
	  t.string :tracking_number
	  t.integer :quickbook_sn
	  t.string :quickbook_status
	 
      t.timestamps
    end
  end
end
