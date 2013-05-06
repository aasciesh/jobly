class AddForeignKeyToVacancy < ActiveRecord::Migration
  def change
    add_column :vacancies, :company_profile_id, :integer
  end
end
