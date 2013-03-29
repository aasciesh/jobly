class CreateLanguageSkills < ActiveRecord::Migration
  def change
    create_table :language_skills do |t|
      t.string :name
      t.integer :level
      t.string :type

      t.timestamps
    end
  end
end
