class NrelService
  def initialize
    @conn = Faraday.get "https://developer.nrel.gov"
  end
end
