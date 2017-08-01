class RenameNameColumnToMembers < ActiveRecord::Migration
  def change
    rename_column :members, :name, :nickname
  end
end
