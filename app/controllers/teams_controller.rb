class TeamsController < ApplicationController

  def index
    @teams = Team.order(:id).map{ |t| TeamRepresenter.new.(t) }
  end

  def show
    @team = Team.find(params[:id])
  end

  def create
    @team = Team.new(team_params)
    if @team.save
      render json: TeamRepresenter.new.(@team)
    else
      render json: @team.errors, status: :unprocessable_entity
    end
  end

  def toggle_favorite
    team = Team.find(params[:id])
    team.toggle_favorite!
    render json: {team: team}
  end

  protected

  def team_params
    params.fetch(:team, {}).permit(:name, :favorite)
  end

end
