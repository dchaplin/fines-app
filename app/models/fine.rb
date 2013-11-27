# == Schema Information
#
# Table name: fines
#
#  id          :integer          not null, primary key
#  date        :datetime
#  description :text
#  status      :string(255)
#  amount      :integer
#  offender_id :integer
#  proposer_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Fine < ActiveRecord::Base
  FINE_AMOUNT = 5

  has_many :votes
  belongs_to :offender, class_name: "User", foreign_key: :offender_id
  belongs_to :proposer, class_name: "User", foreign_key: :proposer_id

  before_validation :set_fine_amount

  def number_of_yes_votes
    votes.where(value: true).count
  end

  def number_of_no_votes
    votes.where(value: false).count
  end

private
  def set_fine_amount
    self.amount = FINE_AMOUNT
  end
end