class Post < ActiveRecord::Base
  attr_accessible :city, :company_reg_no, :company_address, :company_description, :company_name, :company_type, :country_id, :email, :name, :phone, :state_id, :url, :zip, :category_id, :subcategory_id, :user_id
  validates :city ,:presence => true
  belongs_to :category
  belongs_to :subcategory
  belongs_to :user
  belongs_to :state
  belongs_to :country
end
