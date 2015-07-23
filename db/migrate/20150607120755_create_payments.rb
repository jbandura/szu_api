class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :month_nr
      t.integer :year_nr
      t.boolean :paid
    end
  end
end
