require 'rails_helper'

RSpec.describe 'When I search by zipcode' do
  it "with valid zipcode" do
    VCR.use_cassette("search_by_zipcode") do
      # When I visit "/"
      visit '/'
      # And I fill in the search form with 80203
      fill_in :q, with: '80203'

      # And I click "Locate"
      click_on 'Locate'

      # Then I should be on page "/search" with parameters visible in the url
      expect(current_path).to eq "/search"

      # Then I should see a list of the 10 closest stations within 6 miles sorted by distance
      expect(page).to have_selector('.station', count: 10)
    end
  end
end


# As a user
# And the stations should be limited to Electric and Propane
# And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times
