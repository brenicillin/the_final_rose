require 'rails_helper'

RSpec.describe "Contestants Index Page", type: :feature do
  before(:all) do
    @bachelorette_1 = Bachelorette.create!(name: "Hannah Brown", season_number: 15, description: "This one time, at band camp...")
    @bachelorette_2 = Bachelorette.create!(name: "Katie Thurston", season_number: 17, description: "She chose WHO?!")
    @contestant_1 = @bachelorette_1.contestants.create!(name: "John Paul Jones", age: 25, hometown: "New York City")
    @contestant_2 = @bachelorette_2.contestants.create!(name: "Tyler Cameron", age: 27, hometown: "Jupiter, Florida")
  end

  describe "User Story 1" do
    it "can only see contestants for specific bachelorette" do
      visit "/bachelorettes/#{@bachelorette_1.id}/contestants"
  
      within "#contestant-list" do
        expect(page).to have_content(@contestant_1.name)
        expect(page).to have_content(@contestant_1.age)
        expect(page).to have_content(@contestant_1.hometown)
        expect(page).to_not have_content(@contestant_2.name)
        expect(page).to_not have_content(@contestant_2.age)
        expect(page).to_not have_content(@contestant_2.hometown)
      end
  
      visit "/bachelorettes/#{@bachelorette_2.id}/contestants"
  
      within "#contestant-list" do
        expect(page).to have_content(@contestant_2.name)
        expect(page).to have_content(@contestant_2.age)
        expect(page).to have_content(@contestant_2.hometown)
        expect(page).to_not have_content(@contestant_1.name)
        expect(page).to_not have_content(@contestant_1.age)
        expect(page).to_not have_content(@contestant_1.hometown)
      end
    end
  end

  describe "User Story 2" do
    it "each contestant's name is a link to their show page" do
      visit "/bachelorettes/#{@bachelorette_1.id}/contestants"

      expect(page).to have_link(@contestant_1.name)
      click_link(@contestant_1.name)

      expect(current_path).to eq("/contestants/#{@contestant_1.id}")
    end
  end
end