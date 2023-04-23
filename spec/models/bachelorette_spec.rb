require 'rails_helper'

RSpec.describe Bachelorette, type: :model do
  describe 'relationships' do
    it {should have_many :contestants}
  end
  
  before(:all) do
    test_data
  end

  describe 'instance methods' do
    it '#average_contestant_age' do
      expect(@bachelorette_1.average_contestant_age).to eq(26.0)
      expect(@bachelorette_2.average_contestant_age).to eq(27.5)
      expect(@bachelorette_3.average_contestant_age).to eq(28.0)
    end
  end
end
