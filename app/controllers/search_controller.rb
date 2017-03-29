class SearchController < ApplicationController
  def index
    @fuel_stations = NrelFuelStation.nearest_to_zipcode(params[:q])
  end
end
