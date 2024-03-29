class Organisation < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    name :string, :index => true
    timestamps
  end

  self.table_name = "wp_organisation"

  has_many  :themes
  has_many  :groups

  validates_presence_of :name

  #Report the default organisation_id - it's the one called 
  #Automics (or if necessary, the first in the database).
  def self.default
    @defid ||= (self.find_by_name('Automics') || self.first)
  end

  def self.report_field_names
    "name, id"
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
