class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :name, :null => false
      t.string :type, :default => "Organisation"
      t.timestamps
    end
    add_index :subjects, :name, :unique => :true
    add_index :subjects, [:type, :name], :order => {:type => :asc, :name => :asc}
  end
end
