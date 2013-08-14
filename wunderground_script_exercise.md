1) git clone https://github.com/CodeFellowsOrg/weather_api.git
2) cd weather_api
3) bundle install
4) "sign up for free" for a Wunderground API key here:
http://www.wunderground.com/weather/api/
5) You'll get an email asking you to confirm your email address from Wunderground
6) go back to /weather/api, and click on "explore my options" - purchase the free plan
7) The key should be listed on the right of http://www.wunderground.com/weather/api/
8) put the key into your shell with this command:
  export WUNDERAPI=sd123fjhkjeh234asd34 (your key)
9) check that key is in your enviroment with this command:
    echo $WUNDERAPI
10) ruby simple_wunder.rb
