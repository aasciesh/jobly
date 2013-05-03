class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :confirmation_sent_date, :datetime
    add_column :users, :confirmation_code, :string
    add_column :users, :activated, :boolean, :default => false, :null => false
  end
end
