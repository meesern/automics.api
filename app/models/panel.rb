class Panel < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    timestamps
  end

  set_table_name "wp_panel"

  belongs_to :comic
  has_one    :group, :through => :comic
  has_many   :resources
  belongs_to :photo
  has_many   :annotations 

  #Fields reported by the API
  def self.report_field_names
    "id, photo_url"
  end

  def photo_url
    #andand soemtimes just doesn't work!
    self.photo && self.photo.image_url
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
