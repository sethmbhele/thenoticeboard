class RemoveColumnQuestionIdAndSubquestionId < ActiveRecord::Migration
  def up
  	 remove_column :posts, :question_id
     remove_column :posts, :subquestion_id
  end

  def down
  	 add_column :posts, :question_id, :integer
     add_column :posts, :subquestion_id, :integer
  end
end
