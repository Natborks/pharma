class AddRoleToPharmacy < ActiveRecord::Migration[5.1]
  def change
    add_column :pharmacies, :role, :string
  end
end
