class FixColumnInCompanyProfiles < ActiveRecord::Migration
  def change
  	remove_column :company_profiles, :type
  	add_column :company_profiles, :company_type, :string
  end
end
