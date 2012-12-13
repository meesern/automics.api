# encoding: utf-8

class ResourceUploader < CarrierWave::Uploader::Base

  include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  storage :file
  # storage :fog

  # The directory where uploaded files will be stored.
  def store_dir
    theme = model.theme || "nil"
    "images/resources/#{theme}/#{model.class.to_s.underscore}_#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # 
  process :resize_to_limit => [640, 640]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of uploaded files:
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

end
