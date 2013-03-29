class AddUserProfileIdToQualifications < ActiveRecord::Migration
  def change
  	add_column :qualifications, :user_profile_id, :integer
  	add_index :qualifications, :user_profile_id
  end
end
