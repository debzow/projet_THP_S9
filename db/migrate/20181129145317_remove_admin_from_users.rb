class RemoveAdminFromUsers < ActiveRecord::Migration[5.2]
  def down
    remove_column :users, :admin
  end
end
