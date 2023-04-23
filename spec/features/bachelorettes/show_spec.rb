require 'rails_helper'

RSpec.describe "Bachelorette Show Page", type: :feature do
  before(:all) do
    @bachelorette = Bachelorette.create!(name: "Hannah Brown", season_number: 15)
    @bachelorette_2 = Bachelorette.create!(name: "Katie Thurston", season_number: 17)
  end

  describe 'User Story 1' do
    it 'can see bachelorette name, season number, and description' do
      visit "/bachelorettes/#{@bachelorette.id}"

      within "#bachelorette-name" do
        expect(page).to have_content(@bachelorette.name)        
      end

      within "#bachelorette-info" do
        expect(page).to have_content(@bachelorette.season_number)
      end
    end

    it 'shows a link to see the bachelorettes contestants' do
      @contestant = @bachelorette.contestants.create!(name: "John Paul Jones", age: 25, hometown: "New York City")
      @contestant_2 = @bachelorette_2.contestants.create!(name: "Tyler Cameron", age: 27, hometown: "Jupiter, Florida")

      visit "/bachelorettes/#{@bachelorette.id}"
      
      within"#bachelor-link" do
        expect(page).to have_link("Meet the Bachelors!")
        click_link("Meet the Bachelors!")
      end

      expect(current_path).to eq("/bachelorettes/#{@bachelorette.id}/contestants")
    end
  end
end