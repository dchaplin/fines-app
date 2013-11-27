class RenameColumnAndIndex < ActiveRecord::Migration
  def change
    rename_column :fines, :proposed_by_id, :proposer_id
  end
end
