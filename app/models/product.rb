class Product < ActiveRecord::Base
  attr_accessible :name, :price, :released_on

	def self.to_csv(options = {})
		CSV.generate(options) do |csv|
		 csv << column_names
			all.each do |product|
				# csv << product.attributes.values_at(*column_names)
				csv << product.attributes.values
			end
		end
	end
end
