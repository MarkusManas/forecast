class LocationsController < ApplicationController
  def show
    @location = Location.includes(:weather_forecasts).find(params[:id])
    @location.update_weekly_forecast
    render "show"
  end
end