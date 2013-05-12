class AddCoverLetterToApplication < ActiveRecord::Migration
  def change
    add_column :applications, :cover_letter, :string
  end
end
