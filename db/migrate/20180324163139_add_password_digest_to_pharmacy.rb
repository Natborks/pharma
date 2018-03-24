class AddPasswordDigestToPharmacy < ActiveRecord::Migration[5.1]
  def change
    add_column :pharmacies, :password_digest, :string
  end
end
