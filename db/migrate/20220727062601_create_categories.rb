class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :categorie_name
      t.string :seo_name
      t.attachment :image

      t.timestamps
    end
  end
end
