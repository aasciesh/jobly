class CreateQualifications < ActiveRecord::Migration
  def change
    create_table :qualifications do |t|
      t.string :institute_name
      t.string :degree_type
      t.date :start
      t.date :end
      t.string :address
      t.string :website

      t.timestamps
    end
  end
end
