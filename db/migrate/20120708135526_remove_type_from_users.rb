class RemoveTypeFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :type
    add_column :users, :admin, :boolean, :default => false, :null => false
  end

  def down
    remove_column :users, :admin
    add_column :users, :type, :string, :default => "Operator", :null => false
  end
end
