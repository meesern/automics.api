class PanelsController < ApplicationController

  hobo_model_controller

  auto_actions :all

  def api_index
    begin
      @comic = Comic.find(params[:id])
      @panels = @comic.panels
      @data = @panels.map {|panel| panel.select_fields}
      render_api
    rescue
      api_exception
    end
  end

  def api_show
    begin
      @panel = Panel.find(params[:id])
      @data = @panel.select_fields
      @data[:placements] = @panel.placements.map {|pl| pl.select_fields}
      render_api
    rescue
      api_exception
    end
  end

  def api_create
    begin
      #All groups belong to the default organisation if it's not specified
      #data = JSON.parse(params['data'])
      @comic = Comic.find(params[:id])
      @panel = @comic.panels.create!

      @data = @panel.select_fields
      render_api
    rescue
      api_exception
    end
  end

  def api_delete
    begin
      #This needs to grow some constraints
      Panel.destroy(params[:id])
      @data = true
      render_api
    rescue
      api_exception
    end
  end

end
