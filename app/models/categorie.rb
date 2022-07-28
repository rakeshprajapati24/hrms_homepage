class Categorie < ActiveRecord::Base
	 has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
	 validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  def self.to_csv(options = {})
  CSV.generate(options) do |csv|
   	 csv << column_names
    	all.each do |categorie|
      csv << categorie.attributes.values_at(*column_names)
    end
  end
	end
end
