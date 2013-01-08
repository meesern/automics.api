include ApiHelper
class GroupsController < ApplicationController

  hobo_model_controller

  #auto_actions :all

  #We could have used a single method and differentiated on html/json
  #but this would make the client more comlex and less robust
  #(requiring it to set the accept header).
  def api_index
    begin
      @groups = Group.select(Group.report_field_names)
      #Switch groups to hashes ready for output
      @data = @groups.map {|group| group.attributes}
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
      #All groups belong to the default organisation if it's not specified
      data = JSON.parse(params['data'])
      data.reverse_merge! :organisation_id => Organisation.default.id

      logger.info("Creating group with #{data}")
      @group = Group.create(data)
      @data = @group.select_fields
      render_api
    rescue
      api_exception
    end
  end

  def api_update
    begin
      data = JSON.parse(params['data'])
      @group = Group.find_by_hashid(params[:hash])
      @group.update_attributes(data)
      @data = @group.select_fields
      render_api
    rescue
      api_exception
    end
  end

end
