class CreateTagMatches < ActiveRecord::Migration
  def change
    create_table :tag_matches do |t|
      t.integer :tag_id
      t.integer :vacancy_id

      t.timestamps
    end
    add_index :tag_matches, :tag_id
    add_index :tag_matches, :vacancy_id
  end
end
