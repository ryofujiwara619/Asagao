class RenameNicknameColumnToMembers < ActiveRecord::Migration
  def change
    rename_column :members, :nickname, :name
  end
end
