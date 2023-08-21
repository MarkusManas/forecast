require "test_helper"

class RequestForecastServiceTest < ActiveSupport::TestCase
  test "request forecast builds the correct parameters" do
    manila = locations :manila
    params = {
      latitude: manila.latitude,
      longitude: manila.longitude,
      timezone: manila.timezone
    }
    service = RequestForecastService.new(params)
    
    expected_params = {
      latitude: manila.latitude,
      longitude: manila.longitude,
      timezone: manila.timezone,
      daily: [
        'sunrise',
        'sunset',
        'apparent_temperature_max',
        'apparent_temperature_min',
        'precipitation_probability_max',
        'weathercode'
      ]
    }

    assert_equal(expected_params, service.params)
  end
end
