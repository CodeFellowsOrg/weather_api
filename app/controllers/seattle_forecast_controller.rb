class SeattleForecastController < ApplicationController

  def index
    @current_temp = WunderRequest.temp(:f, "Seattle")
  end
end
