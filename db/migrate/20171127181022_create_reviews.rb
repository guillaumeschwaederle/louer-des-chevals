class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.string :content
      t.integer :rating
      t.references :profile, foreign_key: true
      t.references :cheval, foreign_key: true

      t.timestamps
    end
  end
end
