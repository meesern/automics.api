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
