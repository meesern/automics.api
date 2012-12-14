# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    #"public/images/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    "images/photos/#{model.class.to_s.underscore}_#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # All photos fit 640x640
  process :resize_to_limit => [640, 640]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  version :thumb do
    process :resize_to_fill => [100, 100]
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    %w(jpg jpeg png)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

  #
  # API Upload
  #   accept the file as passed in the api data request
  #   name: original filename
  #   blob: base64 file data
  #
  def api_upload(name, blob)
      filename = data["name"]
      ext = File.extname(filename)
      base = File.basename(filename, ext)
      tmp = Tempfile.new([base,ext],:encoding=>'ascii-8bit')
      #For post body upload
      #tmp.write request.body.read
      #tmp.write Base64.decode64(data["blob"])
      tmp.write(data["blob"])
      data[:image] = tmp
  end

end
