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
      @data = Comic.find(params[:id]).select_fields
      render_api
    rescue
      api_exception
    end
  end

  def api_create
    begin
      data = JSON.parse(params['data'])
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
      data = JSON.parse(params['data'])
      @comic = Comic.find(params[:id])
      @comic.update_attributes(data)
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
