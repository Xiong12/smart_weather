# encoding: utf-8

require File.dirname(__FILE__) + '/test_helper.rb'

class TestSmartWeather < Minitest::Test

  def setup
    @provinces = SmartWeather::Province.all
    @cities    = SmartWeather::City.all

    SmartWeather.app_id      = 'Your app id'
    SmartWeather.private_key = 'Your private key'
  end

  def test_provinces_data
    assert_equal true, @provinces.is_a?(Array)
    assert_equal true, @provinces.first.is_a?(Hash)
    assert_equal 1, @provinces.first[:id]
    assert_equal '北京', @provinces.first[:name]
  end

  def test_cities_data
    assert_equal true, @cities.is_a?(Array)
    assert_equal true, @cities.first.is_a?(Hash)
    assert_equal 1, @cities.first[:id]
    assert_equal '101010100', @cities.first[:code]
  end

  def test_get_weather
    assert_equal true, SmartWeather.get_observe(areaid: '101010100').is_a?(Hash)
    assert_equal true, SmartWeather.get_forecast(areaid: '101010100').is_a?(Hash)
    assert_equal true, SmartWeather.get_index(areaid: '101010100').is_a?(Hash)
  end
end
