class CreateStudentGroups < ActiveRecord::Migration
  def change
    create_table :student_groups do |t|
      t.string :name
      t.float :price

      t.timestamps null: false
    end
  end
end
