class AddUserProfileIdToReferences < ActiveRecord::Migration
  def change
  	add_column :references, :user_profile_id, :integer
  	add_index :references, :user_profile_id
  end
end
