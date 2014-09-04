# SmartWeather

中国气象网 SmartWeatherAPI Ruby SDK

详细接口说明请见 [SmartWeatherAPI_Lite_WebAPI版产品使用说明书](http://smart.weather.com.cn/wzfw/smart/weatherapi.shtml)

## Installation

Add this line to your application's Gemfile:

    gem 'smart_weather'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install smart_weather

## Usage

```ruby
require 'smart_weather'

SmartWeather.app_id      = 'your app id'
SmartWeather.private_key = 'your private_key'

# 获取支持的省份
SmartWeather::Province.all

# 获取支持的城市的 areaid
SmartWeather::City.all

# 天气实况
SmartWeather.get_observe(areaid: '101010100')

# 常规预报(3d)
SmartWeather.get_forecast(areaid: '101010100')

# 天气指数
SmartWeather.get_index(areaid: '101010100')
```

## Contributing

1. Fork it ( https://github.com/NaixSpirit/smart_weather/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
