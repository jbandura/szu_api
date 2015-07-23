class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.string :weekday
      t.string :time
      t.timestamps null: false
    end
    add_reference :courses, :student_group, index: true
  end
end
