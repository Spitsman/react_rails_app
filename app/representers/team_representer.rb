class TeamRepresenter

  def call(team)
    {
      name: team.name,
      favorite_sign: team.decorate.display_favorite,
      favorite: team.favorite,
      id: team.id,
      max_scoring_goal_count: team.max_scoring_goal_count,
      max_missed_goal_count: team.max_missed_goal_count
    }
  end

end
