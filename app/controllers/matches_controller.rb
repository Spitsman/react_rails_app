class MatchesController < ApplicationController

  def index
    @matches = Match.order(:id).includes(:teams).includes(:teams_in_matches).map{ |m| Match::IndexRepresenter.new.(m) }
  end

  def create
    puts match_params

    @match = CreateMatchService.new.(match_params)
    if @match
      render json: Match::IndexRepresenter.new.(@match)
    else
      render json: {}, status: :unprocessable_entity
    end
  end

  protected

  def match_params
    params.fetch(:match, {}).permit(:first_team_id, :second_team_id, :first_team_score, :second_team_score, :date)
  end

end
