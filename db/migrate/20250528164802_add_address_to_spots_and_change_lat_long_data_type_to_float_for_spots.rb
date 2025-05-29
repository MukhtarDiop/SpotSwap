class AddAddressToSpotsAndChangeLatLongDataTypeToFloatForSpots < ActiveRecord::Migration[7.1]
  def change
    add_column :spots, :address, :string
    change_column :spots, :lat, :float
    change_column :spots, :long, :float
  end
end
