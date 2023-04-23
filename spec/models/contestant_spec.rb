require 'rails_helper'

RSpec.describe Contestant, type: :model do
  describe 'relationships' do
    it {should belong_to :bachelorette}
    it {should have_many :contestant_outings}
    it {should have_many(:outings).through(:contestant_outings)}
  end
  before(:all) do
    @bachelorette = Bachelorette.create!(name: "Hannah Brown", season_number: 15, description: "This one time, at band camp...")
    @contestant = @bachelorette.contestants.create!(name: "John Paul Jones", age: 25, hometown: "New York City")
  end
  
  describe 'instance methods' do
    it '#find_season' do
      expect(@contestant.find_season).to eq(15)
    end

    it '#season_description' do
      expect(@contestant.season_description).to eq("This one time, at band camp...")
    end
  end
end
