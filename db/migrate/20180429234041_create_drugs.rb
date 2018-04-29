class CreateDrugs < ActiveRecord::Migration[5.1]
  def change
    create_table :drugs do |t|
      t.string :name
      t.integer :quantity
      t.datetime :date_rec
      t.string :desc
      t.references :pharmacy

      t.timestamps
    end
  end
end
