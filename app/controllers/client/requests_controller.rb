class Client::RequestsController < Client::BaseController

  helper_method :resource_request

  def new
  end

  def create
    if resource_request.save
      redirect_to root_path
    else
      render action: :new
    end
  end

  def edit
  end

  def update
    if resource_request.update_attributes(request_params)
      redirect_to root_path
    else
      render action: :edit
    end
  end

  def destroy
    resource_request.destroy
    redirect_to root_path
  end

  protected

  def resource_request
    @resource_request ||= params[:id].present? ? current_user.requests.find(params[:id]) : Request.new(request_params)
  end

  def request_params
    params.fetch(:request, {}).permit(:title, :body, :amount)
  end

end