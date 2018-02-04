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
    Match.where(id: match_ids).joins(:teams_in_matches).where.not(teams_in_matches: {team_id: self.id}).maximum(:score)
  end

  def total_score
    self.teams_in_matches.sum(:score)
  end

  def team_with_closest_score
    self_total_score = self.total_score
    total_scores = Team.where.not(id: self.id).collect{|t| [t.total_score, t.id]}
    h = total_scores.sort.group_by{|e| e[0] <=> self_total_score}
    less = h[-1]
    more = h[1]
    return Team.find(less.last[1]) if more.nil?
    return Team.find(more.first[1]) if less.nil?
    id = if (less.last[0] - self_total_score).abs > (more.first[0] - self_total_score).abs
      more.first[1]
    else
      less.last[1]
    end
    Team.find(id)
  end

  def team_with_max_score_margin
    match_ids = self.teams_in_matches.pluck :match_id
    return nil if match_ids.empty?
    relation = Match.where(id: match_ids).joins(:teams_in_matches).where.not(teams_in_matches: {team_id: self.id}).select("teams_in_matches.*")
    collection = relation.collect{|t| [t.score, t.team_id]}
    Team.find(collection.max[1])
  end

end
