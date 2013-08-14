class ForecastsController < ApplicationController
  before_action :set_forecast, only: [:show, :edit, :update, :destroy]

  # GET /forecasts
  def index
    @temp_in_seattle = WunderRequest.temp(:f, "Seattle")
    @forecasts = Forecast.all
  end

  # GET /forecasts/1
  def show
  end

  # GET /forecasts/new
  def new
    @forecast = Forecast.new
  end

  # GET /forecasts/1/edit
  def edit
  end

  # POST /forecasts
  def create
    @forecast = Forecast.new(forecast_params)

    if @forecast.save
      redirect_to @forecast, notice: 'Forecast was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /forecasts/1
  def update
    if @forecast.update(forecast_params)
      redirect_to @forecast, notice: 'Forecast was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /forecasts/1
  def destroy
    @forecast.destroy
    redirect_to forecasts_url, notice: 'Forecast was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_forecast
      @forecast = Forecast.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def forecast_params
      params.require(:forecast).permit(:state, :location, :temp)
    end
end
