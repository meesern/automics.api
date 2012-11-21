include ApiHelper
class GroupsController < ApplicationController

  hobo_model_controller

  #auto_actions :all

  #We could have used a single method and differentiated on html/json
  #but this would make the client more comlex and less robust
  #(requiring it to set the accept header).
  def api_index
    begin
      @data = Group.select(Group.report_field_names)
      render_api
    rescue
      api_exception
    end
  end

  def api_show
    begin
      @data = Group.find_by_hashid(params[:hash]).select_fields
      render_api
    rescue
      api_exception
    end
  end

  def api_create
    begin
      grp = Group.create(JSON.parse(params['data']))
      @data = grp.select_fields
      render_api
    rescue
      api_exception
    end
  end

  private
  def render_api
      render :json => @data
  end

end
