class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :name
      t.integer :total_level
      t.integer :status
      t.string :info

      t.timestamps null: false
    end
  end
end
