class PostQuestions < ActiveRecord::Migration
  def change
    create_table :post_questions do |t|
      t.integer  :post_id
      t.integer  :question_id
      t.integer  :subquestion_id

      t.timestamps
    end
    add_index :post_questions, :post_id
    add_index :post_questions, :question_id
    add_index :post_questions, :subquestion_id
  end
end
