class Subquestion < ActiveRecord::Base
  attr_accessible :name, :question_id
  belongs_to :question
   has_many :post_questions
end
