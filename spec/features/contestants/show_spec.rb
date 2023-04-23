require 'rails_helper'

RSpec.describe 'Contestant Show Page' do
  before(:all) do
    test_data
  end

  describe "User Story 3" do
    it "I see the contestant's name, season, and the season's description" do
      visit "/contestants/#{@contestant_1.id}"

      within "#contestant-name" do
        expect(page).to have_content(@contestant_1.name)
      end

      within "#contestant-season" do
        expect(page).to have_content(@bachelorette_1.season_number)
        expect(page).to have_content(@bachelorette_1.description)
      end
    end

    it "I see a list of the outings this contestant has been on" do
      visit "/contestants/#{@contestant_1.id}"

      within "#contestant-outings" do
        expect(page).to have_content(@outing_1.name)
      end
    end

    it "Each outing name is a link to the outing's show page" do
      visit "/contestants/#{@contestant_1.id}"

      within "#contestant-outings" do
        click_link @outing_1.name
      end

      expect(current_path).to eq("/outings/#{@outing_1.id}")
    end
  end
end