class AddSecurityCodeToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :security_code, :integer
  end
end
