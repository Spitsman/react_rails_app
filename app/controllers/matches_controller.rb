class MatchesController < ApplicationController

  def index
    @matches = Match.all.map{ |m| MatchRepresenter.new.(m) }
  end

  def create
    if resource_match.save
      render json: MatchRepresenter.new.(resource_match)
    else
      render json: resource_match.errors
    end
  end

  protected

  def resource_match
    @resource_match ||= Match.new(match_params)
  end

  def match_params
    params.fetch(:match, {}).permit!
  end

end
