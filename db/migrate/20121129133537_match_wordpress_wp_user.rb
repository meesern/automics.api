class MatchWordpressWpUser < ActiveRecord::Migration
  def self.up
    rename_column :wp_user, :name, :user_login
    rename_column :wp_user, :email_address, :user_email
    rename_column :wp_user, :created_at, :user_registered
    add_column :wp_user, :user_nicename, :string
    add_column :wp_user, :user_url, :string
    add_column :wp_user, :user_activation_key, :string
    add_column :wp_user, :user_status, :integer
    add_column :wp_user, :display_name, :string
    add_column :wp_user, :spam, :boolean, :default => false
    add_column :wp_user, :deleted, :boolean, :default => false
    remove_column :wp_user, :updated_at

    add_index :wp_group, [:name]
    add_index :wp_group, [:hashid]

    add_index :wp_organisation, [:name]
  end

  def self.down
    rename_column :wp_user, :user_login, :name
    rename_column :wp_user, :user_email, :email_address
    rename_column :wp_user, :user_registered, :created_at
    remove_column :wp_user, :user_nicename
    remove_column :wp_user, :user_url
    remove_column :wp_user, :user_activation_key
    remove_column :wp_user, :user_status
    remove_column :wp_user, :display_name
    remove_column :wp_user, :spam
    remove_column :wp_user, :deleted
    add_column :wp_user, :updated_at, :datetime

    remove_index :wp_group, :name => :index_groups_on_name rescue ActiveRecord::StatementInvalid
    remove_index :wp_group, :name => :index_groups_on_hashid rescue ActiveRecord::StatementInvalid

    remove_index :wp_organisation, :name => :index_organisations_on_name rescue ActiveRecord::StatementInvalid
  end
end
