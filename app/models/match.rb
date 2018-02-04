class Match < ActiveRecord::Base

  has_and_belongs_to_many :teams, join_table: :teams_in_matches
  has_many :teams_in_matches, dependent: :destroy
  validates :date, presence: true

  def first_team
    self.teams.order(:id).first
  end

  def second_team
    self.teams.order(:id).second
  end

  def first_team_score
    self.teams_in_matches.where(team: first_team).first.score
  end

  def second_team_score
    self.teams_in_matches.where(team: second_team).first.score
  end

end
