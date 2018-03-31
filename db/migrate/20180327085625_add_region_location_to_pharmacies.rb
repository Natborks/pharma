class AddRegionLocationToPharmacies < ActiveRecord::Migration[5.1]
  def change
    add_column :pharmacies, :region, :string
    add_column :pharmacies, :location, :string
  end
end
