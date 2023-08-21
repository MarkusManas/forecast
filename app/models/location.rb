class Location < ApplicationRecord
  has_many :weather_forecasts

  validates_presence_of :latitude, :longitude

  scope :alphabetical, -> { order(name: :asc) }

  def update_weekly_forecast
    service = RequestForecastService.new({
      latitude: self.latitude,
      longitude: self.longitude,
      timezone: self.timezone
    })
    weekly_forecast = service.call
    ForecastUpdaterService.new(weekly_forecast, self.id).call
  end
end
