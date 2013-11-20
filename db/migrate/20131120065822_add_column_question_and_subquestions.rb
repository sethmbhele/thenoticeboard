class AddColumnQuestionAndSubquestions < ActiveRecord::Migration
    def change
     add_column :posts, :question_id, :integer
     add_column :posts, :subquestion_id, :integer
    end
end
