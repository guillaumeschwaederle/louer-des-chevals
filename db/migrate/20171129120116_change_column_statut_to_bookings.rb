class ChangeColumnStatutToBookings < ActiveRecord::Migration[5.0]
  def change
    change_column :bookings, :statut, :string, default: "En cours"
  end
end
