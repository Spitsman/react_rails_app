class Admin::HomeController < Admin::BaseController

  helper_method :requests_collection

  def index
  end

  protected

  def requests_collection
    @requests_collection ||= Request.all.decorate
  end

end