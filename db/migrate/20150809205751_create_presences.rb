class CreatePresences < ActiveRecord::Migration
  def change
    create_table :presences do |t|
      t.references :presence_list, index: true, foreign_key: true
      t.references :student, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
