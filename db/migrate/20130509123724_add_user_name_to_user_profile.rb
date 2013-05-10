class AddUserNameToUserProfile < ActiveRecord::Migration
  def change
    add_column :user_profiles, :user_name, :string
  end
end
