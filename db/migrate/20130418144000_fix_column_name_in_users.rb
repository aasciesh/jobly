class FixColumnNameInUsers < ActiveRecord::Migration
  def up
  	rename_column :users, :rememeber_cookie, :remember_cookie
  end

  def down
  end
end
