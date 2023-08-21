class CreateLocations < ActiveRecord::Migration[7.0]
  def change
    create_table :locations do |t|
      t.string :name
      t.decimal :latitude, precision: 12, scale: 8
      t.decimal :longitude, precision: 12, scale: 8

      t.timestamps
    end
  end
end
