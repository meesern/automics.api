class Group < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    name   :string
    hashid :string  #The hash is the secret key used to index the group
    timestamps
  end

  set_table_name "wp_group"

  belongs_to :organisation
  has_many :wp_users
  has_many :themes, :through => :organisation
  has_many :photos
  has_many :comics
  has_many :panels, :through => :comics

  after_create :set_hashid
  
  #Don't use the field name hash - SQLite chokes on it!
  def set_hashid
    self.hashid ||= Digest::SHA1.hexdigest(self.id.to_s + "salty")
    self.save!
    true
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
