class Client::BaseController < ApplicationController

  layout 'client'

  before_filter :require_client

end