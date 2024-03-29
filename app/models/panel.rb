class Panel < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    page_order  :integer
    timestamps
  end

  self.table_name = "wp_panel"

  belongs_to :comic
  has_one    :group, :through => :comic
  has_many   :placements
  belongs_to :photo
  has_many   :annotations 

  #Fields reported by the API
  def self.report_field_names
    "id, page_order, image_url"
  end

  def image_url
    #andand sometimes just doesn't work!
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
