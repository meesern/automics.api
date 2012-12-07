class Photo < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    description :string
    image       :string
    width       :integer
    height      :integer
    fmt         :string
    timestamps
  end

  set_table_name "wp_photo"
  
  #provides image and thumb
  mount_uploader :image, ImageUploader

  belongs_to :group

  def self.report_field_names
    "description, id, width, height, image"
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
