DEV_ERRORS = false

module ApiHelper

  #Any exception while processing an API call should result in a simple 400 response
  #unless we're debugging and want to see what happened
  def api_exception
      raise $! if DEV_ERRORS
      api_error($!.message)
  end

  def api_error(msg)
      render :status => 400, :text => msg
  end

  def render_api
      render :json => @data
  end
end

class ActiveRecord::Base
  #Take the list of names defined for each API class (report_field_names) and 
  #return the hash of attributes of only those names
  def select_fields
    report = {}
    names = self.class.report_field_names.split(', ')
    names.each {|attr| report[:"#{attr}"] = send(attr)}
    report
  end
end

