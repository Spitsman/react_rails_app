class Team::ShowRepresenter

  def call(team)
    {
      name: team.name,
      favorite_sign: team.decorate.display_favorite,
      favorite: team.favorite,
      id: team.id,
      max_scoring_goal_count: team.max_scoring_goal_count,
      max_missed_goal_count: team.max_missed_goal_count,
      team_with_closest_score: {
        name: team.team_with_closest_score&.name,
        total_score: team.team_with_closest_score&.total_score
      },
      team_with_max_score_margin: {
        name: team.team_with_max_score_margin&.name,
        total_score: team.team_with_max_score_margin&.total_score
      },
      matches: team.matches.map{|m| Match::IndexRepresenter.new.(m)}
    }
  end

end
