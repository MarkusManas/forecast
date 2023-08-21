class WeatherForecast < ApplicationRecord
  belongs_to :location

  scope :upcoming, -> { where("date >= ?", Date.today) }

end
