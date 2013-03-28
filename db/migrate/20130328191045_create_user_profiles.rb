class CreateUserProfiles < ActiveRecord::Migration
  def change
    create_table :user_profiles do |t|
      t.string :firstname
      t.string :lastname
      t.date :birth_date
      t.string :gender
      t.string :full_address
      t.string :street
      t.string :city
      t.string :country
      t.integer :zip
      t.text :self_info
      t.text :hobbies
      t.attachment :avatar

      t.timestamps
    end
  end
end
