class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.integer :total_level
      t.string :info
      t.integer :status

      t.timestamps null: false
    end
  end
end
