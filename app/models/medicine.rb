class Medicine < ActiveRecord::Base
  belongs_to :category
  has_many :ava_infos
  has_many :pharmacies, through: :ava_infos
  
  validates :medicine_name, :dosage, :quantity_or_volume, :manufacturer,
            :need_recipe, :price, :category_id, presence: true
  validates :need_recipe, inclusion: {in: ['да','нет']}
  validates :price, numericality: {greater_than: 0}
end


