class Admin::Requests::VersionsController < Admin::BaseController

  helper_method :resource_request

  def index
  end

  protected

  def resource_request
    @resource_request ||= Request.find(params[:request_id])
  end

end