class TeamsController < ApplicationController

  def index
    @teams = Team.order(:id).map{ |t| Team::IndexRepresenter.new.(t) }
  end

  def show
    @team = Team::ShowRepresenter.new.call Team.find(params[:id])
    # @team = Team.find(params[:id])
  end

  def create
    @team = Team.new(team_params)
    if @team.save
      render json: Team::IndexRepresenter.new.(@team)
    else
      render json: @team.errors, status: :unprocessable_entity
    end
  end

  def toggle_favorite
    team = Team.find(params[:id])
    team.toggle_favorite!
    render json: {team: Team::ShowRepresenter.new.(team)}
  end

  protected

  def team_params
    params.fetch(:team, {}).permit(:name)
  end

end
