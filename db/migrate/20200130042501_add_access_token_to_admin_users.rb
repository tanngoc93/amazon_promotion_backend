class AddAccessTokenToAdminUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :admin_users, :access_token, :string, default: nil
  end
end
