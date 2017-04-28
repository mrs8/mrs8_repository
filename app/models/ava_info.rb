class AvaInfo < ActiveRecord::Base
  belongs_to :pharmacy
  belongs_to :medicine
  validates :pharmacy_id, :medicine_id, :quantity, presence: true
  validates :pharmacy_id, uniqueness: {scope: [:medicine_id]}
  validates :quantity, numericality: {only_integer: true, greater_than_or_equal_to: 0}
end


