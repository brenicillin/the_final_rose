require 'rails_helper'

RSpec.describe "Contestants Index Page", type: :feature do
  before(:all) do
    test_data
  end

  describe "User Story 1" do
    it "can only see contestants for specific bachelorette" do
      visit "/bachelorettes/#{@bachelorette_1.id}/contestants"
  
      within "#contestant-list" do
        expect(page).to have_content(@contestant_1.name)
        expect(page).to have_content(@contestant_1.age)
        expect(page).to have_content(@contestant_1.hometown)
        expect(page).to have_content(@contestant_2.name)
        expect(page).to have_content(@contestant_2.age)
        expect(page).to have_content(@contestant_2.hometown)
        expect(page).to_not have_content(@contestant_3.name)
        expect(page).to_not have_content(@contestant_3.age)
        expect(page).to_not have_content(@contestant_3.hometown)
      end
  
      visit "/bachelorettes/#{@bachelorette_2.id}/contestants"
  
      within "#contestant-list" do
        expect(page).to have_content(@contestant_3.name)
        expect(page).to have_content(@contestant_3.age)
        expect(page).to have_content(@contestant_3.hometown)
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

  describe "User Story 6" do
    it "shows a unique list of all hometowns for contestants" do
      visit "/bachelorettes/#{@bachelorette_2.id}/contestants"

      within "#unique-hometowns" do
        expect(page).to have_content(@contestant_3.hometown)
        expect(page).to have_content(@contestant_4.hometown)
      end
    end
  end
end