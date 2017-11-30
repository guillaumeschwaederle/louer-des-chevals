class AddPhotoToChevals < ActiveRecord::Migration[5.0]
  def change
    add_column :chevals, :photo, :string
  end
end
