class ComicsController < ApplicationController

  hobo_model_controller

  auto_actions :all

  def api_index
    begin
      #TODO filter through current group 
      @comics = Comic.select(Comic.report_field_names)
      @data = @comics.map {|comic| comic.attributes}
      render_api
    rescue
      api_exception
    end
  end

  def api_show
    begin
      @comic = Comic.find(params[:id])
      @data = @comic.select_fields
      #add in the list of panels and resources
      @data[:panels] = @comic.panel_list 
      @data[:resources] = @comic.resource_list
      render_api
    rescue
      api_exception
    end
  end

  def api_create
    begin
      data = parse_request_data(params['data'])
      logger.info("Creating comic with #{data}")
      @comic = Comic.create(data)
      @data = @comic.select_fields
      render_api
    rescue
      api_exception
    end
  end

  def api_update
    begin
      data = parse_request_data(params['data'])
      @comic = Comic.find(params[:id])
      @comic.update_attributes(data.except('panels'))
      #Update each panel in the data
      data['panels'].each {|panel| 
        @panel = @comic.panels.find(panel['id'])
        @panel.update_attributes(panel)
      } if data['panels']
      @data = @comic.select_fields
      render_api
    rescue
      api_exception
    end
  end

  def api_delete
    begin
      #This needs constraints
      Comic.destroy(params[:id])
      @data = true
      render_api
    rescue
      api_exception
    end
  end


end
