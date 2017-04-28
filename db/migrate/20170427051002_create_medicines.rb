class CreateMedicines < ActiveRecord::Migration
  def change
    create_table :medicines do |t|
      t.text :medicine_name, null: false
      t.float :dosage, null: false
      t.float :quantity_or_volume, null: false
      t.text :manufacturer, null: false
      t.string :need_recipe, null: false
      t.float :price, null: false
      t.references :category, index: true, foreign_key: true, null: false


      t.timestamps null: false
    end
    
    reversible do |qq|
      qq.up do
        execute ("ALTER TABLE medicines ADD CONSTRAINT check1 CHECK (price > 0)")
        execute ("ALTER TABLE medicines ADD CONSTRAINT check2 CHECK (need_recipe IN ('да', 'нет'))")
      end
      qq.down do
        execute ("ALTER TABLE medicines DROP CONSTRAINT check1")
        execute ("ALTER TABLE medicines DROP CONSTRAINT check2")
      end 
    end
  end
end
