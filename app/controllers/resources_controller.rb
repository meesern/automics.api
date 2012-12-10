class ResourcesController < ApplicationController

  hobo_model_controller

  auto_actions :all

  def update  
    @resource = Resource.find(params[:id])
    @resource.image = params[:image]
    hobo_update(@resource)
  end

  def api_index
    begin
      @theme = Theme.find(params[:id])
      @resources = @theme.resources
      @data = @resources.map {|th| th.select_fields}
      render_api
    rescue
      api_exception
    end
  end

  def api_show
    begin
      @data = Resource.find(params[:id]).select_fields
      render_api
    rescue
      api_exception
    end
  end

end
