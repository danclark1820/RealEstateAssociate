class ChangeColumnNameForOwnerInBuilding < ActiveRecord::Migration
  def change
    rename_column :buildings, :owner, :owner_id
  end
end
