class AddPharmacyNameToPharmacy < ActiveRecord::Migration[5.1]
  def change
    add_column :pharmacies, :pharmacy_name, :string
  end
end
