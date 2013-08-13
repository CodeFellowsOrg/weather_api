require 'rubygems'
require 'bundler/setup'
require 'httparty'

class WunderRequest
  include HTTParty

  def self.temp(system = :c, location)
    if system == :c
      current_observation(location)['temp_c']
    elsif system == :f
      current_observation(location)['temp_f']
    else
      raise "Whaddya want, kelvin?"
    end
  end

  def self.response(location)
    api_key = ENV["WUNDERAPI"]
    api_url = "http://api.wunderground.com/api/#{api_key}/geolookup/conditions/q/#{location}.json"
    HTTParty.get(api_url)
  end

  def self.current_observation(location)
    response(location)['current_observation']
  end
end

puts WunderRequest.response("Seattle")

