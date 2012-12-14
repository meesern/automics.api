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
      @photos = Photo.find(:all)
      #Switch groups to hashes ready for output
      @data = @photos.map {|photo| photo.select_fields}
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
      #data = JSON.parse(params['data'])
      #filename = data["name"]
      #ext = File.extname(filename)
      #base = File.basename(filename, ext)
      #tmp = Tempfile.new([base,ext],:encoding=>'ascii-8bit')
      ##For post body upload
      ##tmp.write request.body.read
      ##tmp.write Base64.decode64(data["blob"])
      #tmp.write(data["blob"])
      #data[:image] = tmp

      @photo = Photo.new(data.except("name","blob"))
      @photo.image = ImageUploader.api_upload(data["name"], data["blob"])
      @photo.save

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
