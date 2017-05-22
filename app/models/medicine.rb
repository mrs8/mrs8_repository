class Medicine < ActiveRecord::Base
  belongs_to :category, inverse_of: :medicines
  has_many :ava_infos, inverse_of: :medicine
  
  validates :medicine_name, :dosage, :quantity_or_volume, :manufacturer,
            :need_recipe, :price, :category_id, presence: true
  validates :need_recipe, inclusion: {in: ['да','нет']}
  validates :price, numericality: {greater_than: 0}
  
  accepts_nested_attributes_for :category
  
  def self.search(params)
    result = Medicine.joins(:ava_infos)
    if params[:medicine_name].present?
      result = result.where( medicine_name: params[:medicine_name])
    end
    if params[:dosage].present?
      result = result.where( dosage: params[:dosage])
    end
    if params[:quantity_or_volume].present?
      result = result.where( quantity_or_volume: params[:quantity_or_volume])
    end
    if params[:manufacturer].present?
      result = result.where( manufacturer: params[:manufacturer])
    end
    if params[:need_recipe].present?
      result = result.where( need_recipe: params[:need_recipe])
    end
    if params[:price].present?
      result = result.where( price: params[:price])
    end
    if params[:category_id].present?
      result = result.where( category_id: params[:category_id])
    end
    if params[:pharmacy_id].present?
      result = result.where( "ava_infos.pharmacy_id = ?", params[:pharmacy_id])
    end
  result.all.uniq
  end
end


