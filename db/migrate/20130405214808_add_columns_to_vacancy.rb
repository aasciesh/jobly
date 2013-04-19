class AddColumnsToVacancy < ActiveRecord::Migration
  def change
    add_column :vacancies, :min_salary, :integer
    add_column :vacancies, :max_salary, :integer
  end
end
