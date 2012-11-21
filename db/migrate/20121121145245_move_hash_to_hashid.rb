class MoveHashToHashid < ActiveRecord::Migration
  def self.up
    rename_column :wp_group, :hash, :hashid
  end

  def self.down
    rename_column :wp_group, :hashid, :hash
  end
end
