class CreateOperatorSubjects < ActiveRecord::Migration
  def change
    create_table :operator_subjects do |t|
      t.references :operator
      t.references :subject
      t.timestamps
    end
    add_index :operator_subjects, :operator_id
    add_index :operator_subjects, :subject_id
    add_index :operator_subjects, [:operator_id, :subject_id], :unique => true
  end
end
