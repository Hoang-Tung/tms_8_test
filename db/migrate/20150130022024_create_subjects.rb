class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :name
      t.references :course, index: true
      t.integer :total_level
      t.string :info
      t.integer :status

      t.timestamps null: false
    end
    add_foreign_key :subjects, :courses
  end
end
