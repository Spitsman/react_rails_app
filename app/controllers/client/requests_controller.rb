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
    if params[:id].present?
      @resource_request = current_user.requests.find(params[:id])
    else
      @resource_request = Request.new(request_params)
      @resource_request.users << current_user
    end
    @resource_request.current_user = current_user
    @resource_request
  end

  def request_params
    params.fetch(:request, {}).permit(:title, :body, :amount)
  end

end