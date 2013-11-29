class Subcategory < ActiveRecord::Base
  attr_accessible :name, :status, :text, :category_id
  validates :name, presence: true
  validates :name, :uniqueness =>true
  validates :category_id, presence: true
  auto_strip_attributes :name
  belongs_to :category
  has_many :questions
  
end
