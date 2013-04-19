class CreateCompanyProfiles < ActiveRecord::Migration
  def change
    create_table :company_profiles do |t|
      t.string :name
      t.string :company_type
      t.text :description
      t.string :street
      t.string :city
      t.string :country
      t.integer :zip
      t.string :website
      t.text :contact
      t.attachment :logo
      t.timestamps
    end
  end
end
