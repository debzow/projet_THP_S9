class AddColumnToTableUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :admin, :string, :default => false
    #Ex:- :default =>''
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
