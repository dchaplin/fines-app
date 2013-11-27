class FixVoteColumnName < ActiveRecord::Migration
  def change
    rename_column :votes, :vote_value, :value
  end
end
