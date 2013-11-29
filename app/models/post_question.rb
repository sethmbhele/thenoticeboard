class PostQuestion < ActiveRecord::Base
  attr_accessible :post_id, :question_id, :subquestion_id
  belongs_to :post
  belongs_to :question
  belongs_to :subquestion  
end