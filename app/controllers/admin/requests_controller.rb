class Admin::RequestsController < Admin::BaseController

  helper_method :resource_request

  def edit
  end

  def update
    if resource_request.update_attributes(request_params)
      redirect_to admin_url
    else
      render action: :edit
    end
  end

  def destroy
    resource_request.destroy
    redirect_to admin_url
  end

  protected

  def resource_request
    @resource_request ||= Request.find(params[:id])
  end

  def request_params
    params.require(:request).permit!
  end

end