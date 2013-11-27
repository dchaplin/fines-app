class AddForeignKeys < ActiveRecord::Migration
  def change
    add_index :votes, :voter_id
    add_index :votes, :fine_id
    add_index :fines, :offender_id
    add_index :fines, :proposer_id
  end
end
