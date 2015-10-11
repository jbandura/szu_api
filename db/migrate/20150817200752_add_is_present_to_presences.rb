class AddIsPresentToPresences < ActiveRecord::Migration
  def change
    add_column :presences, :is_present, :boolean
  end
end
