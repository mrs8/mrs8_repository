class Category < ActiveRecord::Base
	has_many :medicines, inverse_of: :category
	
	validates :category_name, presence: true
	validates :category_name, uniqueness: true
end


