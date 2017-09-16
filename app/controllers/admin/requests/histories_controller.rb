class Admin::Requests::HistoriesController < Admin::BaseController

  helper_method :histories_collection, :resource_request

  def index
  end

  protected

  def histories_collection
    @histories_collection ||= resource_request.histories
  end

  def resource_request
    @resource_request ||= Request.find(params[:request_id])
  end

end