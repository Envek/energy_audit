class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :name, :null => false
      t.references :activity_category

      t.timestamps
    end
    add_index :activities, :activity_category_id
    add_index :activities, :name, :unique => true
  end
end
