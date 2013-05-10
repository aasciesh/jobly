class AddForeignKeyToReferences < ActiveRecord::Migration
  def change
    add_column :references, :application_id, :integer
    add_index :references, :application_id
  end
end
