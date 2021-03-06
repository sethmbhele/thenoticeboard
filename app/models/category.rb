class Category < ActiveRecord::Base
  attr_accessible :name, :status, :text
  validates :name, presence: true
  validates :name, :uniqueness =>true
  auto_strip_attributes :name
  has_many :subcategories
end
