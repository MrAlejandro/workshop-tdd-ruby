# frozen_string_literal: true

require 'fixtures/meta_weather_http_client_mock'

RSpec.describe MetaWeatherForecaster do
  before do
    http_client = MetaWeatherHttpClientMock.new
    @forecaster = MetaWeatherForecaster.new(http_client)
  end

  it 'should return weather' do
    weather_forecast = @forecaster.forecast('Berlin')

    expected = { city: 'Berlin', temperature: 8.9 }
    assert { weather_forecast == expected }
  end

  it 'should fail for unknown city' do
    expect { @forecaster.forecast("dummy_city") }.to raise_error
  end
end
