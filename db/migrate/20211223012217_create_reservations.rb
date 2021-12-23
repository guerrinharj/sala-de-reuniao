class CreateReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :reservations do |t|
      t.datetime :date
      t.string :description
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
