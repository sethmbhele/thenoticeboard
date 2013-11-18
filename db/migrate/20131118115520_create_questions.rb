class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string   :name
      t.integer  :subcategory_id

      t.timestamps
    end
    add_index :questions, :subcategory_id
  end
end
