class TypeToTyp < ActiveRecord::Migration
  def self.up
    rename_column :wp_resource, :type, :typ

    remove_index :wp_group, :name => :index_wp_group_on_hashid rescue ActiveRecord::StatementInvalid
    remove_index :wp_group, :name => :index_wp_group_on_name rescue ActiveRecord::StatementInvalid
    add_index :wp_group, [:name]
    add_index :wp_group, [:hashid]

    remove_index :wp_organisation, :name => :index_wp_organisation_on_name rescue ActiveRecord::StatementInvalid
    add_index :wp_organisation, [:name]
  end

  def self.down
    rename_column :wp_resource, :typ, :type

    remove_index :wp_group, :name => :index_groups_on_name rescue ActiveRecord::StatementInvalid
    remove_index :wp_group, :name => :index_groups_on_hashid rescue ActiveRecord::StatementInvalid
    add_index :wp_group, [:hashid]
    add_index :wp_group, [:name]

    remove_index :wp_organisation, :name => :index_organisations_on_name rescue ActiveRecord::StatementInvalid
    add_index :wp_organisation, [:name]
  end
end
