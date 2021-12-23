class AddReferenceSlot < ActiveRecord::Migration[6.0]
  def change
    add_reference :reservations, :slot, foreign_key: true
    add_reference :reservations, :user, foreign_key: true
  end
end
