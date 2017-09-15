class HomeController < ApplicationController

  helper_method :requests_collection

  def index
  end

  protected

  def requests_collection
    @requests_collection ||= current_user.requests
  end

end