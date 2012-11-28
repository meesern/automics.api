class ThemesController < ApplicationController

  hobo_model_controller

  auto_actions :all

  def api_index
    begin
      @organisation = Organisation.find(params[:id])
      @themes = @organisation.themes
      @data = @themes.map {|th| th.select_fields}
      render_api
    rescue
      api_exception
    end
  end

  def api_show
    begin
      @theme = Theme.find(params[:id])
      @data = @theme.select_fields
      @data[:resources] = @theme.resources.map {|res| res.select_fields}
      render_api
    rescue
      api_exception
    end
  end

end
