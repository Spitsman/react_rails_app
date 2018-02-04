class CreateMatchService

  def call(params = {})
    ActiveRecord::Base.transaction do
      match = Match.new(date: params[:date])
      return false unless match.save

      firsts_team_in_match = TeamsInMatch.new(team_id: params[:first_team_id], score: params[:first_team_score], match_id: match.id)
      second_team_in_match = TeamsInMatch.new(team_id: params[:second_team_id], score: params[:second_team_score], match_id: match.id)

      return false unless firsts_team_in_match.save && second_team_in_match.save

      match
    end
  end

end
