require 'rails_helper'

RSpec.describe 'When I search by zipcode' do
  it "with valid zipcode" do
    VCR.use_cassette("search_by_zipcode") do

      visit '/'

      fill_in :q, with: '80203'

      click_on 'Locate'

      expect(current_path).to eq "/search"

      expect(page).to have_selector('.station', count: 10)

      within first('.station') do
        expect(page).to have_content 'ELEC'
        expect(page).to have_content 'UDR'
        expect(page).to have_content '800 Acoma St, Denver, CO'
        expect(page).to have_content '0.3117'
        expect(page).to have_content '24 hours daily'
      end
    end
  end
end
