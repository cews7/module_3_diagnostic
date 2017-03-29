class NrelService
  def self.nearest_to_zipcode(zipcode)
    response = Faraday.get("https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?location=#{zipcode}&api_key=#{ENV["NREL_KEY"]}&radius=6.0&limit=10&fuel_type=ELEC,LPG")
    JSON.parse(response.body, symbolize_names: true)[:fuel_stations]
  end
end
