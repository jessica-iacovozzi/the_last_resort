class ChangeStatusToBookings < ActiveRecord::Migration[7.0]
  def change
    change_column :bookings, :status, :string, default: 'Pending', null: false
  end
end
