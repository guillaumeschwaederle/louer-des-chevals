class AddVilleAndStreetToChevals < ActiveRecord::Migration[5.0]
  def change
    add_column :chevals, :ville, :string
    add_column :chevals, :rue, :string
  end
end
