class CreateShippings < ActiveRecord::Migration[7.0]
  def change
    create_table :shippings do |t|
      t.string :zip,                     null: false
      t.integer :area_id,                null: false
      t.string :city,                    null: false
      t.string :street_address
      t.string :building_name,           null: false
      t.string :telephone_number,        null: false
      t.references :purchase,            null: false, foreign_key: true
      t.timestamps
    end
  end
end
