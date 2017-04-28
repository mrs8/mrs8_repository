class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.text :category_name, null: false
      t.index :category_name, unique: true
      
      t.timestamps null: false
    end
  end
end
