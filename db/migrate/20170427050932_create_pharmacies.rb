class CreatePharmacies < ActiveRecord::Migration
  def change
    create_table :pharmacies do |t|
      t.text :adress, null: false
      t.integer :number, null: false
      t.text :nearest_metro, null: false
      t.index [:adress, :number, :nearest_metro], unique: true
      
      t.timestamps null: false
    end
  end
end
