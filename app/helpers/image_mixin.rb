
module ImageMixin
  def image_url
    self.image.andand.url
  end

  def thumb_url
    self.image.andand.thumb.url
  end
end

