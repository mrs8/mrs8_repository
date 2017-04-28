class CreateAvaInfos < ActiveRecord::Migration
  def change
    create_table :ava_infos do |t|
      t.references :pharmacy, index: true, foreign_key: true, null: false
      t.references :medicine, index: true, foreign_key: true, null: false
      t.index [:pharmacy_id, :medicine_id], unique: true
      t.integer :quantity, null: false

      t.timestamps null: false
    end
    
    reversible do |qq|
      qq.up do
        execute ("ALTER TABLE ava_infos ADD CONSTRAINT check1 CHECK (quantity >= 0)")
      end
      qq.down do
        execute ("ALTER TABLE ava_infos DROP CONSTRAINT check1")
      end 
    end
    
    
  end
end
