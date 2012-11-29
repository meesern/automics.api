class WpUserToWpUsers < ActiveRecord::Migration
  def self.up
    rename_table :wp_user, :wp_users

    remove_index :wp_group, :name => :index_wp_group_on_hashid rescue ActiveRecord::StatementInvalid
    remove_index :wp_group, :name => :index_wp_group_on_name rescue ActiveRecord::StatementInvalid
    add_index :wp_group, [:name]
    add_index :wp_group, [:hashid]

    remove_index :wp_organisation, :name => :index_wp_organisation_on_name rescue ActiveRecord::StatementInvalid
    add_index :wp_organisation, [:name]

    remove_index :wp_users, :name => :index_wp_user_on_state rescue ActiveRecord::StatementInvalid
    remove_index :wp_users, :name => :index_wp_user_on_group_id rescue ActiveRecord::StatementInvalid
    add_index :wp_users, [:group_id]
    add_index :wp_users, [:state]
  end

  def self.down
    rename_table :wp_users, :wp_user

    remove_index :wp_group, :name => :index_groups_on_name rescue ActiveRecord::StatementInvalid
    remove_index :wp_group, :name => :index_groups_on_hashid rescue ActiveRecord::StatementInvalid
    add_index :wp_group, [:hashid]
    add_index :wp_group, [:name]

    remove_index :wp_organisation, :name => :index_organisations_on_name rescue ActiveRecord::StatementInvalid
    add_index :wp_organisation, [:name]

    remove_index :wp_user, :name => :index_wp_users_on_group_id rescue ActiveRecord::StatementInvalid
    remove_index :wp_user, :name => :index_wp_users_on_state rescue ActiveRecord::StatementInvalid
    add_index :wp_user, [:state]
    add_index :wp_user, [:group_id]
  end
end
