require 'rubygems'
require 'bundler/setup'
require 'geocoder'
require 'awesome_print'


ap Geocoder.search("Seattle").first.data['geometry']['location']
