class Panel < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    timestamps
  end

  set_table_name "wp_panel"

  belongs_to :comic
  has_one  :group, :through => :comic
  has_many :resorces
  has_one  :photo
  has_many :annotations, :through => :photo

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
