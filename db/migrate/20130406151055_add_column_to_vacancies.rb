class AddColumnToVacancies < ActiveRecord::Migration
  def change
    add_column :vacancies, :job_duration, :string
    add_index :vacancies, :job_duration
    add_index :vacancies, :job_type
  end
end