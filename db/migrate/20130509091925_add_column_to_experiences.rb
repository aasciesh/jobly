class AddColumnToExperiences < ActiveRecord::Migration
  def change
    add_column :experiences, :user_profile_id, :integer
  end
end
