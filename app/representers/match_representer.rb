class MatchRepresenter

  def call(match)
    {
      first_team: {
        id: match.first_team.id,
        name: match.first_team.name,
        favorite: match.first_team.favorite
      },
      second_team: match.second_team.name,
      first_team_score: match.first_team_score,
      second_team_score: match.second_team_score,
      date: match.date,
      id: match.id
    }
  end

end
