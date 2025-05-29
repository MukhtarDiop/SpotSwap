class RemoveLatAndLongFromSpots < ActiveRecord::Migration[7.1]
  def change
    remove_column :spots, :lat, :float
    remove_column :spots, :long, :float
  end
end
