class AddPlacement < ActiveRecord::Migration
  def self.up
    create_table :placements do |t|
      t.float    :x
      t.float    :scale
      t.integer  :z_index
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :resource_id
      t.integer  :panel_id
    end
    add_index :placements, [:resource_id]
    add_index :placements, [:panel_id]

    remove_index :wp_group, :name => :index_wp_group_on_hashid rescue ActiveRecord::StatementInvalid
    remove_index :wp_group, :name => :index_wp_group_on_name rescue ActiveRecord::StatementInvalid
    add_index :wp_group, [:name]
    add_index :wp_group, [:hashid]

    remove_index :wp_organisation, :name => :index_wp_organisation_on_name rescue ActiveRecord::StatementInvalid
    add_index :wp_organisation, [:name]
  end

  def self.down
    drop_table :placements

    remove_index :wp_group, :name => :index_groups_on_name rescue ActiveRecord::StatementInvalid
    remove_index :wp_group, :name => :index_groups_on_hashid rescue ActiveRecord::StatementInvalid
    add_index :wp_group, [:hashid]
    add_index :wp_group, [:name]

    remove_index :wp_organisation, :name => :index_organisations_on_name rescue ActiveRecord::StatementInvalid
    add_index :wp_organisation, [:name]
  end
end
