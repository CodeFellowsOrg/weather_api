require 'rubygems'
require 'bundler/setup'  # loads in all the Gems from the Gemfile
require 'httparty'
require 'awesome_print'
require 'pry'

class WunderRequest
  include HTTParty

  def self.temp(system = :f, state, location)
    if system == :c
      current_observation(state, location)['temp_c']
    elsif system == :f
      current_observation(state, location)['temp_f']
    else
      raise "Whaddya want, kelvin?"
    end
  end

  def self.response(state, location)
    api_key = ENV["WUNDERAPI"]
    api_url = "http://api.wunderground.com/api/#{api_key}/geolookup/conditions/q/#{state}/#{location}.json"
    binding.pry
    HTTParty.get(api_url)
  end

  def self.current_observation(state, location)
    response(state, location)['current_observation']
  end

  def self.temp_f(state, location)
    current_observation(state, location)['temp_f']
  end
end

ap WunderRequest.temp_f("Seattle")

