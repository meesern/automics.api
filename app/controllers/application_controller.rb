class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :allow_cross_domain_access, 
                :only=>[:api_index, :api_show, :api_create, :api_update, :api_delete]


  def allow_cross_domain_access
    response.headers["Access-Control-Allow-Origin"] = "*"
    response.headers["Access-Control-Allow-Methods"] = "*"
  end

  def raise_404
    raise ActionController::RoutingError.new('Not Found')
  end

end
