class AddTitleToSpots < ActiveRecord::Migration[7.1]
  def change
    add_column :spots, :title, :string
  end
end
