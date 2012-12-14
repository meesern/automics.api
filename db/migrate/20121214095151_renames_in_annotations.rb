class RenamesInAnnotations < ActiveRecord::Migration
  def self.up
    rename_column :wp_annotation, :formatting_options, :foptions
    rename_column :wp_annotation, :xpos_percent, :xoff
    rename_column :wp_annotation, :ypos_percent, :yoff

    remove_index :wp_group, :name => :index_wp_group_on_hashid rescue ActiveRecord::StatementInvalid
    remove_index :wp_group, :name => :index_wp_group_on_name rescue ActiveRecord::StatementInvalid
    add_index :wp_group, [:name]
    add_index :wp_group, [:hashid]

    remove_index :wp_organisation, :name => :index_wp_organisation_on_name rescue ActiveRecord::StatementInvalid
    add_index :wp_organisation, [:name]
  end

  def self.down
    rename_column :wp_annotation, :foptions, :formatting_options
    rename_column :wp_annotation, :xoff, :xpos_percent
    rename_column :wp_annotation, :yoff, :ypos_percent

    remove_index :wp_group, :name => :index_groups_on_name rescue ActiveRecord::StatementInvalid
    remove_index :wp_group, :name => :index_groups_on_hashid rescue ActiveRecord::StatementInvalid
    add_index :wp_group, [:hashid]
    add_index :wp_group, [:name]

    remove_index :wp_organisation, :name => :index_organisations_on_name rescue ActiveRecord::StatementInvalid
    add_index :wp_organisation, [:name]
  end
end
