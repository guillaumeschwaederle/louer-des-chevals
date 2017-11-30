class AddCoordinatesToChevals < ActiveRecord::Migration[5.0]
  def change
    add_column :chevals, :latitude, :float
    add_column :chevals, :longitude, :float
  end
end
