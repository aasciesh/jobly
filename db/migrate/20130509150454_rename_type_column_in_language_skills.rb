class RenameTypeColumnInLanguageSkills < ActiveRecord::Migration
 	def change
		rename_column :language_skills, :type, :skill_type	
	end
end
