class Adjustments1 < ActiveRecord::Migration
  def self.up
    add_column :wp_theme, :organisation_id, :integer

    add_column :wp_annotation, :panel_id, :integer
    remove_column :wp_annotation, :photo_id

    add_index :wp_theme, [:organisation_id]

    remove_index :wp_annotation, :name => :index_wp_annotation_on_photo_id rescue ActiveRecord::StatementInvalid
    add_index :wp_annotation, [:panel_id]
  end

  def self.down
    remove_column :wp_theme, :organisation_id

    remove_column :wp_annotation, :panel_id
    add_column :wp_annotation, :photo_id, :integer

    remove_index :wp_theme, :name => :index_wp_theme_on_organisation_id rescue ActiveRecord::StatementInvalid

    remove_index :wp_annotation, :name => :index_wp_annotation_on_panel_id rescue ActiveRecord::StatementInvalid
    add_index :wp_annotation, [:photo_id]
  end
end
