class AddDescriptionToActivities < ActiveRecord::Migration
  def change
    add_column :activities,          :description, :string
    add_column :activity_categories, :description, :string
  end
end
