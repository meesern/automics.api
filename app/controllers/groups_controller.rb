class GroupsController < ApplicationController

  hobo_model_controller

  #auto_actions :all

  #We could have used a single method and differentiated on html/json
  #but this would make the client more comlex and less robust
  #(requiring it to set the accept header).
  def api_index
    begin
      data = Group.select("name, organisation_id")
      render :json => data
    rescue
      api_exception
    end
  end

  def api_show(id)
    begin
      data = Group.select("name, organisation_id")
      render :json => data
    rescue
      api_exception
    end
  end

end
