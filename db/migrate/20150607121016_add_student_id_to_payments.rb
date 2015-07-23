class AddStudentIdToPayments < ActiveRecord::Migration
  def change
    add_reference :payments, :student, index: true, foreign_key: true
  end
end
