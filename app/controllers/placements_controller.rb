class PlacementsController < ApplicationController

  hobo_model_controller

  auto_actions :all

  def api_index
    begin
      @panel = Panel.find(params[:panel])
      @placements = @panel.placements
      @data = @placements.map {|place| place.select_fields}
      render_api
    rescue
      api_exception
    end
  end

  def api_show
    begin
      @placement = Placement.find(params[:id])
      @data = @placement.select_fields
      render_api
    rescue
      api_exception
    end
  end

  def api_create
    begin
      data = JSON.parse(params['data'])
      @panel = Panel.find(params[:panel])
      @resource = Resource.find(params[:resource])
      data[:resource] = @resource
      @placement = @panel.placements.create(data)
      @data = @placement.select_fields
      render_api
    rescue
      api_exception
    end
  end

  def api_delete
    begin
      #This needs some constraints
      Placement.destroy(params[:id])
      @data = true
      render_api
    rescue
      api_exception
    end
  end

end
