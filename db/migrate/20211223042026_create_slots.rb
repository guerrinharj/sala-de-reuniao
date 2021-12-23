class CreateSlots < ActiveRecord::Migration[6.0]
  def change
    create_table :slots do |t|
      t.string :day
      t.string :hour
      t.timestamps
    end
  end
end
