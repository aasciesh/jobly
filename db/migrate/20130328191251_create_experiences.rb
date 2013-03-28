class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.string :employer
      t.string :full_address
      t.string :business_field
      t.string :position
      t.text :responsibilities
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
