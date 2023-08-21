class CreateWeatherForecasts < ActiveRecord::Migration[7.0]
  def change
    create_table :weather_forecasts do |t|
      t.datetime :date
      t.datetime :sunrise
      t.datetime :sunset
      t.decimal :apparent_temperature_max, precision: 3, scale: 1
      t.decimal :apparent_temperature_min, precision: 3, scale: 1
      t.integer :precipitation_probability_max
      t.integer :weathercode

      t.belongs_to(:location, foreign_key: true)

      t.timestamps
    end
  end
end
