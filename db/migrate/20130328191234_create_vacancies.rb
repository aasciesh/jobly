class CreateVacancies < ActiveRecord::Migration
  def change
    create_table :vacancies do |t|
      t.string :title
      t.text :description
      t.datetime :deadline
      t.string :job_type
      t.string :job_address
      t.string :street
      t.string :city
      t.string :country
      t.integer :zip
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
