class Match::IndexRepresenter

  def call(match)
    {
      first_team: {
        id: match.first_team.id,
        name: match.first_team.name,
        favorite: match.first_team.favorite
      },
      second_team: {
        id: match.second_team.id,
        name: match.second_team.name,
        favorite: match.second_team.favorite
      },
      first_team_score: match.first_team_score,
      second_team_score: match.second_team_score,
      date: match.decorate.display_date,
      id: match.id
    }
  end

end
