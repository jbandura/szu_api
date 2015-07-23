class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.string :surname
      t.string :street
      t.string :city
      t.string :country
      t.string :phone_nr
      t.boolean :accepted_terms

      t.timestamps null: false
    end
  end
end
