class AnnotationsController < ApplicationController

  hobo_model_controller

  auto_actions :all

  def api_index
    begin
      #TODO filter through current group 
      #TODO account for panel
      @annotation = Annotation.select(Annotation.report_field_names)
      @data = @annotation.map {|annotation| annotation.attributes}
      render_api
    rescue
      api_exception
    end
  end

  def api_show
    begin
      @annotation = Annotation.find(params[:id])
      @data = @annotation.select_fields
      render_api
    rescue
      api_exception
    end
  end

  def api_create
    begin
      data = JSON.parse(params['data'])
      logger.info("Creating annotation with #{data}")
      @annotation = Annotation.create(data)
      @data = @annotation.select_fields
      render_api
    rescue
      api_exception
    end
  end

  def api_delete
    begin
      #This needs some constraints
      Annotation.destroy(params[:id])
      @data = true
      render_api
    rescue
      api_exception
    end
  end

end
