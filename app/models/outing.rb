class Outing < ApplicationRecord
  has_many :contestant_outings
  has_many :contestants, through: :contestant_outings

  def find_contestants
    contestants.pluck(:name)
  end

  def number_of_contestants
    contestants.count
  end
end