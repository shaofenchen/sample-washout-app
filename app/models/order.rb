class Order < ActiveRecord::Base
	has_many :line_items, :dependent => :destroy
	scope :ebay, where("orders.platform ='Ebay'")
	scope :amazon, where("orders.platform ='amazon'")
	
end
