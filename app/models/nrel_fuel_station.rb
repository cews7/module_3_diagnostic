class NrelFuelStation
  attr_reader :fuel_type, :name, :distance, :hours, :attrs
  def initialize(attrs = {})
    @fuel_type = attrs[:fuel_type_code]
    @name      = attrs[:station_name]
    @distance  = attrs[:distance]
    @hours     = attrs[:access_days_time]
    @attrs     = attrs
  end

  def address
    "#{@attrs[:street_address]}, #{@attrs[:city]}, #{@attrs[:state]}"
  end

  def self.nearest_to_zipcode(zipcode)
    NrelService.nearest_to_zipcode(zipcode).map do |raw_station|
      NrelFuelStation.new(raw_station)
    end
  end
end
