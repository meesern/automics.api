class Annotation < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    text               :string
    bubble_style       :string
    foptions           :string
    xoff               :float
    yoff               :float
    timestamps
  end

  set_table_name "wp_annotation"

  belongs_to :panel
  has_one :group, :through => :panel

  #Fields reported by the API
  def self.report_field_names
    "id, text, bubble_style, foptions, xoff, yoff"
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
