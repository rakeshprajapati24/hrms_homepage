class Product < ActiveRecord::Base
  has_many :product_images

  accepts_nested_attributes_for :product_images, :allow_destroy => true

	def self.to_csv(options = {})
  CSV.generate(options) do |csv|
   	 csv << column_names
    	all.each do |product|
      csv << product.attributes.values_at(*column_names)
    end
  end
	end
end
