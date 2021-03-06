class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.date :start_date
      t.date :end_date
      t.string :statut
      t.string :message
      t.references :profile, foreign_key: true
      t.references :cheval, foreign_key: true

      t.timestamps
    end
  end
end
