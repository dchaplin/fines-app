class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :voter_id
      t.integer :fine_id
      t.boolean :vote_value

      t.timestamps
    end
  end
end
