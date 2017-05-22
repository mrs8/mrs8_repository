class Pharmacy < ActiveRecord::Base
	has_many :ava_infos, inverse_of: :pharmacy, dependent: :destroy
	accepts_nested_attributes_for :ava_infos, allow_destroy: true
	
	validates :adress, :number, :nearest_metro, presence: true 
	validates :adress, uniqueness: {scope: [:number, :nearest_metro]}
	

end



