class PanelsController < ApplicationController

  hobo_model_controller

  auto_actions :all

  def api_index
    begin
      if (params[:id])
        @comic = Comic.find(params[:id])
        @panels = @comic.panels
      else
        #TODO mediate with current group
        @panels = Panel.all
      end
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
      @data[:annotations] = @panel.annotations.map {|pl| pl.select_fields}
      render_api
    rescue
      api_exception
    end
  end

  def api_create
    begin
      #All groups belong to the default organisation if it's not specified
      data = parse_request_data(params['data'])
      @comic = Comic.find(params[:id])
      unless data[:page_order]
        biggest = (@comic.panels.map {|p| p.page_order || 0}.max)
        nxt = (biggest || 0) + 1
        data = {:page_order=>nxt}.merge(data)
      end
      @panel = @comic.panels.create!(data)
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
