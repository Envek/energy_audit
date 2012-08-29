class AddDescriptionToHouseType < ActiveRecord::Migration
  def change
    add_column :house_types, :description, :string
  end
end
