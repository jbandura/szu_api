class AddGroupIdToStudents < ActiveRecord::Migration
  def change
  	add_reference :students, :student_group, index: true, foreign_key: true
  end
end
