class CreateReferences < ActiveRecord::Migration
  def change
    create_table :references do |t|
      t.string :referee_name
      t.string :phone
      t.string :email
      t.text :referee_info

      t.timestamps
    end
  end
end
