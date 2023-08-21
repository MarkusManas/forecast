class ViewingForecastsTest < ActionDispatch::IntegrationTest

  test 'able to see the correct fields' do
    Timecop.freeze(Time.utc(2023,5,7)) do
      Location.any_instance.stubs(:update_weekly_forecast).returns(true)
      city = locations :manila
      yesterday_forecast = weather_forecasts :manila20230506
      today_forecast = weather_forecasts :manila20230507
      tomorrow_forecast = weather_forecasts :manila20230508

      visit location_path(city)

      assert page.has_content?(city.name)
      # assert upcoming forecasts can be seen
      assert page.has_content?(today_forecast.date.to_date.to_fs(:short))
      assert page.has_content?(today_forecast.sunrise.to_fs(:time))
      assert page.has_content?(today_forecast.sunset.to_fs(:time))
      assert page.has_content?(today_forecast.apparent_temperature_max)
      assert page.has_content?(today_forecast.apparent_temperature_min)
      assert page.has_content?(today_forecast.precipitation_probability_max.to_fs(:percentage, precision: 0))
      
      assert page.has_content?(tomorrow_forecast.date.to_date.to_fs(:short))
      assert page.has_content?(tomorrow_forecast.sunrise.to_fs(:time))
      assert page.has_content?(tomorrow_forecast.sunset.to_fs(:time))
      assert page.has_content?(tomorrow_forecast.apparent_temperature_max)
      assert page.has_content?(tomorrow_forecast.apparent_temperature_min)
      assert page.has_content?(tomorrow_forecast.precipitation_probability_max.to_fs(:percentage, precision: 0))
      
      # refute  past forecasts
      refute page.has_content?(yesterday_forecast.date.to_date.to_fs(:short))
    end
  end

  test 'ability to swap between cities' do
    Timecop.freeze(Time.utc(2023,5,7)) do
      Location.any_instance.stubs(:update_weekly_forecast).returns(true)

      abroad = locations :buenos_aires
      local = locations :manila

      manila_forecast = weather_forecasts :manila20230507
      buenos_aires_forecast = weather_forecasts :buenos_aires20230507

      visit location_path(local)

      assert page.has_content?(local.name)

      #switch to another city
      click_link abroad.name

      assert page.has_content?(abroad.name)
      assert page.has_content?(buenos_aires_forecast.apparent_temperature_max)
      assert page.has_content?(buenos_aires_forecast.apparent_temperature_min)

      #switch back
      click_link local.name

      assert page.has_content?(local.name)
      assert page.has_content?(manila_forecast.apparent_temperature_max)
      assert page.has_content?(manila_forecast.apparent_temperature_min)
    end
  end
end