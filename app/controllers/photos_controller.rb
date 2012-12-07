class PhotosController < ApplicationController

  hobo_model_controller

  auto_actions :all

  def update  
    @photo = Photo.find(params[:id])
    @photo.image = params[:image]
    hobo_update(@photo)
  end

  def api_index
    begin
      #This will need to be through current group
      @photos = Photo.select(Photo.report_field_names)
      #Switch groups to hashes ready for output
      @data = @photos.map {|photo| photo.attributes}
      render_api
    rescue
      api_exception
    end
  end

  def api_show
    begin
      @data = Photo.find(params[:id]).select_fields
      render_api
    rescue
      api_exception
    end
  end

  def api_create
    begin
      #All groups belong to the default organisation if it's not specified
      data = JSON.parse(params['data'])
      logger.info("Creating photo with #{data}")
      @photo = Photo.create(data)
      @data = @photo.select_fields
      render_api
    rescue
      api_exception
    end
  end

  def api_update
    begin
      data = JSON.parse(params['data'])
      @photo = Photo.find(params[:id])
      @photo.update_attributes(data)
      @photo = @photo.select_fields
      render_api
    rescue
      api_exception
    end
  end

  def api_delete
    begin
      #This needs to grow some constraints
      Photo.destroy(params[:id])
      @data = true
      render_api
    rescue
      api_exception
    end
  end

end
