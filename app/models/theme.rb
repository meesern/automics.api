class Theme < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    name :string
    timestamps
  end

  set_table_name "wp_theme"

  has_many :resources
  belongs_to :organisation

  validates_presence_of :name

  def self.report_field_names
    "name, id"
  end

  def self.default
    @defid ||= (self.find_by_name("Default") || self.first)
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
