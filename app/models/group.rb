class Group < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    name :string
    hash :string  #The hash is the secret key used to index the group
    timestamps
  end

  set_table_name "wp_group"

  belongs_to :organisation
  has_many :wp_users
  has_many :themes, :through => :organisation
  has_many :photos
  has_many :comics
  has_many :panels, :through => :comics

  def initialize
    super.initialize
    self.hash = Digest::SHA1.hexdigest(self.id.to_s + "salty")
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
