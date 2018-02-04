class CreateMatchService

  def call(params = {})
    ActiveRecord::Base.transaction do
      match = Match.new(date: params[:date])
      return false unless match.save

      first_team = Team.find(params[:first_team_id])
      second_team = Team.find(params[:second_team_id])

      firsts_team_in_match = TeamsInMatch.new(team: first_team, score: params[:first_team_score], match_id: match.id)
      second_team_in_match = TeamsInMatch.new(team: second_team, score: params[:second_team_score], match_id: match.id)

      return false unless firsts_team_in_match.save && second_team_in_match.save

      match
    end
  rescue
    nil
  end

end
