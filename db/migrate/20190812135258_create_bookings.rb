class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.date :starting_date
      t.date :ending_date
      t.integer :total_price
      t.references :user, foreign_key: true
      t.references :cat, foreign_key: true

      t.timestamps
    end
  end
end


