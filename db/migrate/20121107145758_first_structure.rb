class FirstStructure < ActiveRecord::Migration
  def self.up
    create_table :wp_annotation do |t|
      t.string   :text
      t.string   :bubble_style
      t.string   :formatting_options
      t.float    :xpos_percent
      t.float    :ypos_percent
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :photo_id
    end
    add_index :wp_annotation, [:photo_id]

    create_table :wp_photo do |t|
      t.string   :description
      t.string   :place
      t.integer  :width
      t.integer  :height
      t.string   :fmt
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :group_id
    end
    add_index :wp_photo, [:group_id]

    create_table :wp_group do |t|
      t.string   :name
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :organisation_id
    end
    add_index :wp_group, [:organisation_id]

    create_table :wp_organisation do |t|
      t.string   :name
      t.datetime :created_at
      t.datetime :updated_at
    end

    create_table :wp_comic do |t|
      t.string   :name
      t.string   :description
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :group_id
    end
    add_index :wp_comic, [:group_id]

    create_table :wp_panel do |t|
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :comic_id
    end
    add_index :wp_panel, [:comic_id]

    create_table :wp_resource do |t|
      t.string   :name
      t.string   :type
      t.string   :image_place
      t.string   :text
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :theme_id
    end
    add_index :wp_resource, [:theme_id]

    create_table :wp_theme do |t|
      t.string   :name
      t.datetime :created_at
      t.datetime :updated_at
    end

    create_table :wp_user do |t|
      t.string   :crypted_password, :limit => 40
      t.string   :salt, :limit => 40
      t.string   :remember_token
      t.datetime :remember_token_expires_at
      t.string   :name
      t.string   :email_address
      t.boolean  :administrator, :default => false
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :group_id
      t.string   :state, :default => "invited"
      t.datetime :key_timestamp
    end
    add_index :wp_user, [:group_id]
    add_index :wp_user, [:state]
  end

  def self.down
    drop_table :wp_annotation
    drop_table :wp_photo
    drop_table :wp_group
    drop_table :wp_organisation
    drop_table :wp_comic
    drop_table :wp_panel
    drop_table :wp_resource
    drop_table :wp_theme
    drop_table :wp_user
  end
end
