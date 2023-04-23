require 'rails_helper'

RSpec.describe Outing, type: :model do
  describe 'relationships' do
    it {should have_many :contestant_outings}
    it {should have_many(:contestants).through(:contestant_outings)}
  end
  
  before(:all) do
    test_data
  end

  describe 'instance methods' do
    it '#find_contestants' do
      expect(@outing_1.find_contestants).to eq(["John Paul Jones", "Tyler Cameron"])
      expect(@outing_2.find_contestants).to eq(["Joe Coleman", "Nate Coleman"])
      expect(@outing_3.find_contestants).to eq(["Brandon Jones", "Clayton Echard"])
    end

    it '#number_of_contestants' do
      expect(@outing_1.number_of_contestants).to eq(2)
      expect(@outing_2.number_of_contestants).to eq(2)
      expect(@outing_3.number_of_contestants).to eq(2)
    end
  end
end