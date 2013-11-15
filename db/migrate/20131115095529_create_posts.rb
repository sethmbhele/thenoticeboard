class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :name,:limit =>45
      t.string :company_name,:limit =>90
      t.string :company_type,:limit =>45
      t.integer :company_reg_no
      t.string :company_address,:limit =>90
      t.text :company_description
      t.integer :country_id
      t.integer :state_id
      t.string :city
      t.string :zip
      t.string :phone
      t.string :email
      t.string :url,:limit =>90
      t.integer :user_id
      t.integer :category_id
      t.integer :subcategory_id

      t.timestamps
    end
      add_index :posts, :user_id
      add_index :posts, :state_id
      add_index :posts, :country_id
      add_index :posts, :category_id
      add_index :posts, :subcategory_id

  end
end
