class AddAddressToPharmacy < ActiveRecord::Migration[5.1]
  def change
    add_column :pharmacies, :address, :string
  end
end
