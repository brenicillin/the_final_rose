class Contestant <ApplicationRecord
  belongs_to :bachelorette
  has_many :contestant_outings
  has_many :outings, through: :contestant_outings

  scope :distinct_hometowns, -> { distinct.pluck(:hometown) }

  def find_season
    bachelorette.season_number
  end

  def season_description
    bachelorette.description
  end
end
