class Comic < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    name        :string
    description :string
    timestamps
  end

  self.table_name = "wp_comic"

  belongs_to :group
  has_many   :panels, :order => :page_order

  validates_presence_of :name

  def resources
    #andand is broken!
    #self.group.andand.current_theme.andand.resources
    self.group && self.group.current_theme && self.group.current_theme.resources
  end

  def panel_list
      self.panels && self.panels.map {|panel| panel.select_fields}
  end

  def resource_list
      self.resources && self.resources.map {|res| res.select_fields}
  end

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
