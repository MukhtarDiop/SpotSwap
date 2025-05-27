class CreateSpots < ActiveRecord::Migration[7.1]
  def change
    create_table :spots do |t|
      t.text :description
      t.text :category
      t.decimal :lat
      t.decimal :long
      t.decimal :rate
      t.decimal :length
      t.decimal :width
      t.decimal :height
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
