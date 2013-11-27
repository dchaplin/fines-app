class CreateFines < ActiveRecord::Migration
  def change
    create_table :fines do |t|
      t.datetime :date
      t.text :description
      t.string :status
      t.integer :amount
      t.integer :offender_id
      t.integer :proposer_id

      t.timestamps
    end
  end
end
