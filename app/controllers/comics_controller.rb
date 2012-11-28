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


end
