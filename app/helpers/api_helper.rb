DEV_ERRORS = true

module ApiHelper

  def api_exception
      raise $! if DEV_ERRORS
      api_error($!.message)
  end

  def api_error(msg)
      render :status => 400, :text => msg
  end

end
