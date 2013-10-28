class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name,:limit =>90
      t.text :text
      t.boolean :status, :default => true

      t.timestamps
    end
  end
end
