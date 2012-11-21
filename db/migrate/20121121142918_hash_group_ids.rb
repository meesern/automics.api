class HashGroupIds < ActiveRecord::Migration
  def self.up
    add_column :wp_group, :hash, :string
  end

  def self.down
    remove_column :wp_group, :hash
  end
end
