class MatchesController < ApplicationController

  def index
    @matches = Match.order(:id).map{ |m| MatchRepresenter.new.(m) }
  end

  def create
    @match = Match.new(match_params)
    if @match.save
      render json: MatchRepresenter.new.(@match)
    else
      render json: @match.errors
    end
  end

  protected

  def match_params
    params.fetch(:match, {}).permit!
  end

end
