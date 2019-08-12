class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.date :starting_date
      t.date :ending_date
      t.integer :total_price
      t.references :user_id, foreign_key: true
      t.references :cat_id, foreign_key: true

      t.timestamps
    end
  end
end
