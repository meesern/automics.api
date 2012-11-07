class Resource < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    name        :string
    type        :string
    image_place :string
    text        :string
    timestamps
  end

  belongs_to :theme

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
