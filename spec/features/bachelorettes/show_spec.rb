require 'rails_helper'

RSpec.describe Bachelorette Show Page, type: :feature do
  before(:all) do
    @bachelorette = Bachelorette.create!(name: "Hannah Brown", season_number: 15, description: "The most dramatic season yet!")
  end
  describe 'User Story 1' do
    it 'can see bachelorette name, season number, and description' do
      visit "/bachelorettes/#{@bachelorette.id}"

      within "#bachelorette-name" do
        expect(page).to have_content(@bachelorette.name)        
      end

      within "#bachelorette-info" do
        expect(page).to have_content(@bachelorette.season_number)
        expect(page).to have_content(@bachelorette.description)
      end
    end

    it 'shows a link to see the bachelorettes contestants' do
      visit "/bachelorettes/#{@bachelorette.id}"

      within"#bachelor-link" do
        expect(page).to have_link("Bachelors")
        click_link("Bachelors")
      end
      
      expect(current_path).to eq("/bachelorettes/#{@bachelorette.id}/contestants")
    end
  end
end