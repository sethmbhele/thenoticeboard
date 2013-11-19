class Question < ActiveRecord::Base
  attr_accessible :name, :subcategory_id
  belongs_to :subcategory
  has_many :subquestions 
end
