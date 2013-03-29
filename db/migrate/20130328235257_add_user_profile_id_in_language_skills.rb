class AddUserProfileIdInLanguageSkills < ActiveRecord::Migration
  def change
  	add_column :language_skills, :user_profile_id, :integer
  	add_index :language_skills, :user_profile_id
  end
end
