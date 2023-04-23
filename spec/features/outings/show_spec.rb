require 'rails_helper'

RSpec.describe 'Outing Show Page' do
  before(:all) do
    test_data
  end

  describe "User Story 4" do
    it "I see the outing's name, location, and date" do
      visit "/outings/#{@outing_1.id}"
      save_and_open_page
      within "#outing-name" do
        expect(page).to have_content(@outing_1.name)
      end

      within "#outing-info" do
        expect(page).to have_content(@outing_1.location)
        expect(page).to have_content(@outing_1.date.strftime("%D"))
        expect(page).to have_content("2")
        expect(page).to have_content("John Paul Jones")
        expect(page).to have_content("Tyler Cameron")
      end
    end
  end
end