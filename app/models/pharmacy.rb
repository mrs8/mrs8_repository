class Pharmacy < ActiveRecord::Base
	has_many :ava_infos
	has_many :medicines, through: :ava_infos
	
	validates :adress, :number, :nearest_metro, presence: true 
	validates :adress, uniqueness: {scope: [:number, :nearest_metro]}
end



