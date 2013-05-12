class AddColumnToUserProfiles < ActiveRecord::Migration
  def change
    add_column :user_profiles, :latitude, :float
    add_column :user_profiles, :longitude, :float
  end
end
