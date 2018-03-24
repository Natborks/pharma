class AddIndexToPharmacyEmail < ActiveRecord::Migration[5.1]
  def change
    add_index :pharmacies, :email, unique: true
  end
end
