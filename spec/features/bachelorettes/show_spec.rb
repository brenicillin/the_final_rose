require 'rails_helper'

RSpec.describe "Bachelorette Show Page", type: :feature do
  before(:all) do
    test_data
  end

  describe 'User Story 1' do
    it 'can see bachelorette name, season number, and description' do
      visit "/bachelorettes/#{@bachelorette_1.id}"
      
      within "#bachelorette-name" do
        expect(page).to have_content(@bachelorette_1.name)        
      end

      within "#bachelorette-info" do
        expect(page).to have_content(@bachelorette_1.season_number)
        expect(page).to have_content(@bachelorette_1.description)
      end
    end

    it 'shows a link to see the bachelorettes contestants' do

      visit "/bachelorettes/#{@bachelorette_1.id}"
      
      within"#bachelor-link" do
        expect(page).to have_link("Meet the Bachelors!")
        click_link("Meet the Bachelors!")
      end

      expect(current_path).to eq("/bachelorettes/#{@bachelorette_1.id}/contestants")
    end
  end

  describe "User Story 5" do
    it "can see the average age of all of the bachelorette's contestants" do
      visit bachelorette_path(@bachelorette_1)
      
      within "#bachelorette-info" do
        expect(page).to have_content("Average Contestant Age: 26")
      end
    end
  end
end