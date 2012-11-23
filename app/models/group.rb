class Group < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    name   :string, :index => true
    hashid :string, :index => true #The hash is the secret key used to index the group
    timestamps
  end

  set_table_name "wp_group"

  belongs_to :organisation
  has_many :wp_users
  has_many :themes, :through => :organisation
  has_many :photos
  has_many :comics
  has_many :panels, :through => :comics

  validates_presence_of :name
  validates_presence_of :organisation

  after_create :set_hashid

  #Fields reported by the API
  def self.report_field_names
    "name, hashid"
  end
  
  #Don't use the field name hash - SQLite chokes on it!
  def set_hashid
    self.hashid ||= Digest::SHA1.hexdigest(self.id.to_s + "salty")
    self.save!
  end

  def select_fields
    self.attributes.slice(*Group.report_field_names.split(', '))
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
