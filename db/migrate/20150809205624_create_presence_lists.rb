class CreatePresenceLists < ActiveRecord::Migration
  def change
    create_table :presence_lists do |t|
      t.references :course, index: true, foreign_key: true
      t.datetime :datetime

      t.timestamps null: false
    end
  end
end
