class Client::Requests::AnswersController < Client::BaseController

  helper_method :resource_request

  def show
  end

  protected

  def resource_request
    @resource_request ||= Request.find(params[:request_id])
  end

end