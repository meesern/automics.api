class Resource < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    name        :string
    typ         :string
    image       :string
    text        :string
    timestamps
  end

  self.table_name = "wp_resource"

  belongs_to :theme

  validates_presence_of :name

  #provides image and thumb
  include ImageMixin
  mount_uploader :image, ResourceUploader

  #Fields reported in the API
  def self.report_field_names
    "name, id, typ, image_url, thumb_url, text"
  end

  #Fields used by views in application.dryml
  def form_names
    "name, typ, text, theme"
  end

  #def select_fields in api_helper

  # --- Permissions --- #

  def create_permitted?
    acting_user.administrator?
  end

  def update_permitted?
    acting_user.administrator?
  end

  def destroy_permitted?
    acting_user.administrator?
  end

  def view_permitted?(field)
    true
  end

end
