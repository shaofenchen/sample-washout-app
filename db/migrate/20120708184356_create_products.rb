class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :model
      t.string :description
      t.integer :category_id

      t.timestamps
    end
  end
end
