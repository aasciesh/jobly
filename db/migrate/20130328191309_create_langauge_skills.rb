class CreateLangaugeSkills < ActiveRecord::Migration
  def change
    create_table :langauge_skills do |t|
      t.string :name
      t.integer :level
      t.string :type

      t.timestamps
    end
  end
end
