class Placement < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    xoff    :float
    yoff    :float
    scale   :float
    z_index :integer
    timestamps
  end

  belongs_to :resource
  belongs_to :panel
  
  #Fields reported by the API
  def self.report_field_names
    "resource_id, xoff, yoff, scale, z_index"
  end

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
