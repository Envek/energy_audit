class CreatePeriods < ActiveRecord::Migration
  def change
    create_table :periods do |t|
      t.date :date, :null => false
      t.boolean :published, :default => false

      t.timestamps
    end
    add_index :periods, :date, :unique => true, :order => {:date => :desc}
  end
end
