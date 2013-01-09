class PhotosController < ApplicationController

  hobo_model_controller

  auto_actions :all

  def update  
    @photo = Photo.find(params[:id])
    @photo.image = params[:image]
    hobo_update(@photo)
  end

  def create  
    hobo_create
    @photo.image = params[:image]
    @photo.save!
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
      logger.info("create photo")
      #The call has to be create here even though we will call save 
      #as ImageUploader needs the model id
      data = JSON.parse(params['data'])
      @photo = Photo.create(data.except("name","blob"))
      logger.info("created photo: #{@photo}")
      api_upload(data["name"], data["blob"])
      logger.info("uploaded")
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

  private

  #
  # API Upload
  #   accept the file as passed in the api data request
  #   name: original filename
  #   blob: base64 file data
  #
  def api_upload(name, blob)
      filename = name
      ext = File.extname(filename)
      base = File.basename(filename, ext)
      tmp = Tempfile.new([base,ext],:encoding=>'ascii-8bit')
      logger.info("created tempfile: #{tmp}")
      #For post body upload
      #tmp.write request.body.read
      tmp.write Base64.decode64(blob)
      @photo.image = ImageUploader.new
      logger.info("storing tempfile: #{tmp}")
      @photo.image.store!(tmp)
      logger.info("stored")
      @photo.save
      logger.info("saved")
      @photo.reload #get the attached ImageUploader
  end

end
