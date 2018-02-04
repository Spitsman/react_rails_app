class Team < ActiveRecord::Base

  validates :name, presence: true
  has_and_belongs_to_many :matches, join_table: :teams_in_matches
  has_many :teams_in_matches, dependent: :destroy


  def toggle_favorite!
    self.favorite = !self.favorite
    save
  end

  def max_scoring_goal_count
    self.teams_in_matches.maximum(:score)
  end

  def max_missed_goal_count
    match_ids = self.teams_in_matches.pluck :match_id
    Match.where(id: match_ids).joins(:teams_in_matches).where.not(teams_in_matches: {team_id: Team.first.id}).maximum(:score)
  end

end
