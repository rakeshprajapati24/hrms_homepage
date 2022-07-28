class Contact < ActiveRecord::Base
	has_many :job_possitions

	# def self.search(search)
	#   if search
	#     find(:all, :conditions => ['first_name LIKE ?', "%#{search}%"])
	#   else
	#     find(:all)
	#   end
	# end
	def self.to_csv(options = {})
  CSV.generate(options) do |csv|
   	 csv << column_names
    	all.each do |contact|
      csv << contact.attributes.values_at(*column_names)
    end
  end
	end
	end
