class AddAddressToSpotsAndChangeLatLongDataTypeToFloatForSpots < ActiveRecord::Migration[7.1]
  def change
    add_column :spots, :address, :string
    change_column :spots, :latitude, :float
    change_column :spots, :longitude, :float
  end
end
