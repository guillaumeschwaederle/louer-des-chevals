class CreateChevals < ActiveRecord::Migration[5.0]
  def change
    create_table :chevals do |t|
      t.string :name
      t.string :description
      t.string :address
      t.integer :taille
      t.integer :price
      t.integer :pattes
      t.references :profile, foreign_key: true
      t.references :robe, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
