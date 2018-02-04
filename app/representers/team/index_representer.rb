class Team::IndexRepresenter

  def call(team)
    {
      name: team.name,
      favorite_sign: team.decorate.display_favorite,
      favorite: team.favorite,
      id: team.id
    }
  end

end
