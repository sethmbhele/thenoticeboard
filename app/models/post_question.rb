class PostQuestion < ActiveRecord::Base
  attr_accessible :post_id, :question_id, :subquestion_id
end