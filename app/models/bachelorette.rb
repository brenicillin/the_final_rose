class Bachelorette <ApplicationRecord
  has_many :contestants
  
  def average_contestant_age
    contestants.average(:age).to_f
  end
end
