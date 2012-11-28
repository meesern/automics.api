class Photo < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    description :string
    place       :string
    width       :integer
    height      :integer
    fmt         :string
    timestamps
  end

  set_table_name "wp_photo"

  belongs_to :group

  def self.report_field_names
    "description, id, width, height, place"
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
