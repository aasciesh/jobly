class AddBookmarkColumnToApplication < ActiveRecord::Migration
  def change
    add_column :applications, :bookmark, :boolean, default: false
  end
end
