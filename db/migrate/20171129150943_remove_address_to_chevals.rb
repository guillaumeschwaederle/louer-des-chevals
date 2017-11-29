class RemoveAddressToChevals < ActiveRecord::Migration[5.0]
  def change
    remove_column :chevals, :address
  end
end
