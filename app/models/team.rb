class Team < ActiveRecord::Base

  validates :name, presence: true
  has_many :matches, as: :first_team
  

  def toggle_favorite!
    self.favorite = !self.favorite
    save
  end

  def max_scoring_goal_count
    [self.matches.maximum(:first_team_score), self.mathes.maximum(:second_team_score)].max
  end

  def max_missed_goal_count
  end

end
