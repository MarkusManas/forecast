require 'json'
require 'net/http'
require 'uri'

URL = 'https://api.open-meteo.com/v1/forecast' # preferably an environment variable

class RequestForecastService
  attr_reader :response, :params

  def initialize(params)
    default_params = {
      daily: [
        'sunrise',
        'sunset',
        'apparent_temperature_max',
        'apparent_temperature_min',
        'precipitation_probability_max',
        'weathercode'
      ]
    }

    @params = params.merge(default_params)
  end

  def call
    uri = URI.parse(URL)

    uri.query = URI.encode_www_form(@params)
    req = Net::HTTP::Get.new(uri.request_uri)
    https = Net::HTTP.new(uri.host, uri.port)
    https.use_ssl = true

    # @response = https.request(req)

    @response = Rails.cache.fetch(uri, expires_in: 12.hours) do
      https.request(req)
    end

    JSON.parse(@response.body)
  end    
end
