# encoding: utf-8

require 'oj'

module SmartWeather

  module ClassMethods

    attr_accessor :datas

    def load file_path
      @datas = Oj.object_load(IO.read(file_path), symbol_keys: true)
    end

    alias :all :datas
  end

  module Province
    extend ClassMethods
    load(File.dirname(__FILE__) + '/data/provinces.json')
  end

  module City
    extend ClassMethods
    load(File.dirname(__FILE__) + '/data/cities.json')
  end
end
