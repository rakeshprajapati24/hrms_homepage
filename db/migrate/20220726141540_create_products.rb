class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :product_name
      t.string :product_description
      t.integer :price
      t.integer :weight
      t.string :seo_name

      t.timestamps
    end
  end
end
