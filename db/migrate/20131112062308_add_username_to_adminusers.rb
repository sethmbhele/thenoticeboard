class AddUsernameToAdminusers < ActiveRecord::Migration
  def change
    add_column :adminusers, :username, :string
  end
end
