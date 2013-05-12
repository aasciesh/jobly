class CreateApplicationReferences < ActiveRecord::Migration
  def change
    create_table :application_references do |t|
      t.integer :application_id
      t.integer :reference_id

      t.timestamps
    end
  end
end
