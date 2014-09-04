# encoding: utf-8

require "smart_weather/version"
require "smart_weather/data"
require "restclient_api_base"
require "base64"
require "openssl"

module SmartWeather
  include RestclientApiBase

  self.base_url = 'http://open.weather.com.cn/data/?'

  class << self

    attr_accessor :app_id, :private_key

    def get_observe options = {}
      get_weather(areaid: options[:areaid], type: 'observe')
    end

    def get_forecast options = {}
      get_weather(areaid: options[:areaid], type: 'forecast3d')
    end

    def get_index options = {}
      get_weather(areaid: options[:areaid], type: 'index')
    end

    def get_weather options = {}
      areaid = options[:areaid]
      type   = options[:type]
      date   = Time.now.strftime("%Y%m%d%H%M")
      key    = generate_key(areaid, type, date)

      url = "areaid=#{areaid}&type=#{type}&date=#{date}&appid=#{@app_id[0, 6]}&key=#{key}"

      res = self.get(url)
      format_weather_result(res, url, options)
    end

    def format_weather_result response, api_url, options = {}
      begin
        Oj.load(response)
      rescue
        write_log(response, api_url, options)
      end
    end

    def generate_key areaid, type, date
      public_key = base_url + "areaid=#{areaid}&type=#{type}&date=#{date}&appid=#{@app_id}"
      CGI::escape(Base64.strict_encode64(OpenSSL::HMAC.digest('sha1', @private_key, public_key)))
    end
  end
end
