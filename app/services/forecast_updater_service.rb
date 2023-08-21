class ForecastUpdaterService
  def initialize(forecast, location_id)
    @forecast = forecast
    @location = Location.find location_id
  end

  def call
    forecast_keys = ['sunrise', 'sunset', 'apparent_temperature_max',
      'apparent_temperature_min', 'precipitation_probability_max', 'weathercode']

    @forecast['daily']['time'].each_with_index do |date, i|
      forecast_params = {}
      forecast_keys.map { |key|  forecast_params[key] = @forecast['daily'][key][i] }
      updated_forecast = @location.weather_forecasts.find_or_create_by(date: date)
      updated_forecast.update(forecast_params)
    end
  end
end
