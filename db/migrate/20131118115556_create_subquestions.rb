class CreateSubquestions < ActiveRecord::Migration
  def change
    create_table :subquestions do |t|
      t.string   :name
      t.integer  :question_id

      t.timestamps
    end
    add_index :subquestions, :question_id
  end
end
