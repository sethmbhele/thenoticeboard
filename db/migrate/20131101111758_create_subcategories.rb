class CreateSubcategories < ActiveRecord::Migration
  def change
    create_table :subcategories do |t|
      t.string :name,:limit =>90
      t.text :text
      t.boolean :status, :default => true
      t.references :category

      t.timestamps
    end
    add_index :subcategories, :category_id

    
  end
end
