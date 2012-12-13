class AddPhotoToPanel < ActiveRecord::Migration
  def self.up
    add_column :wp_panel, :photo_id, :integer

    remove_index :wp_group, :name => :index_wp_group_on_hashid rescue ActiveRecord::StatementInvalid
    remove_index :wp_group, :name => :index_wp_group_on_name rescue ActiveRecord::StatementInvalid
    add_index :wp_group, [:name]
    add_index :wp_group, [:hashid]

    remove_index :wp_organisation, :name => :index_wp_organisation_on_name rescue ActiveRecord::StatementInvalid
    add_index :wp_organisation, [:name]

    add_index :wp_panel, [:photo_id]
  end

  def self.down
    remove_column :wp_panel, :photo_id

    remove_index :wp_group, :name => :index_groups_on_name rescue ActiveRecord::StatementInvalid
    remove_index :wp_group, :name => :index_groups_on_hashid rescue ActiveRecord::StatementInvalid
    add_index :wp_group, [:hashid]
    add_index :wp_group, [:name]

    remove_index :wp_organisation, :name => :index_organisations_on_name rescue ActiveRecord::StatementInvalid
    add_index :wp_organisation, [:name]

    remove_index :wp_panel, :name => :index_wp_panel_on_photo_id rescue ActiveRecord::StatementInvalid
  end
end
