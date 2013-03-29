class AddUserProfileIdToApplication < ActiveRecord::Migration
  def change
  	add_column :applications, :user_profile_id, :integer
  	add_index :applications, :user_profile_id
  end
end
