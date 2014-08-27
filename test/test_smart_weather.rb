# encoding: utf-8

require File.dirname(__FILE__) + '/test_helper.rb'

class TestSmartWeather < Minitest::Test

  def setup
    @provinces = SmartWeather::Province.all
    @cities    = SmartWeather::City.all
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
end
