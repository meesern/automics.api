class Comic < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    name        :string
    description :string
    timestamps
  end

  set_table_name "wp_comic"

  belongs_to :group
  has_many   :panels

  validates_presence_of :name

  #Fields reported by the API
  def self.report_field_names
    "name, id, description"
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
