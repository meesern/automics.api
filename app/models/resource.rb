class Resource < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    name        :string
    type        :string
    image_place :string
    text        :string
    timestamps
  end

  set_table_name "wp_resource"

  belongs_to :theme

  validates_presence_of :name

  def self.report_field_names
    "name, id, type, image_place, text"
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
