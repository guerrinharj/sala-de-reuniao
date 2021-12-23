class AddWeekToSlotColumn < ActiveRecord::Migration[6.0]
  def change
    add_column :slots, :week, :integer
  end
end
