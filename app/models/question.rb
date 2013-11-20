class Question < ActiveRecord::Base
  attr_accessible :name, :subcategory_id,:subquestions_attributes
  belongs_to :subcategory
  has_many :subquestions 
  has_many :posts
  accepts_nested_attributes_for :subquestions, :allow_destroy=> true
  validates :name, presence: true
  validates :subcategory, presence: true
end
