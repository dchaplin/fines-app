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

  state_machine :status, :initial => :Pending do
    event :issue_fine do
      transition [:Pending, :Rejected] => :Issued
    end

    event :reject_fine do
      transition [:Pending, :Issued] => :Rejected
    end

    event :fine_paid do
      transition :Issued => :Paid
    end

    event :reset do 
      transition [:Issued, :Rejected] => :Pending
    end
  end

  def initialize
    super()
  end

  def number_of_yes_votes
    votes.where(value: true).count
  end

  def number_of_no_votes
    votes.where(value: false).count
  end

  def number_of_votes
    number_of_yes_votes + number_of_no_votes
  end

  def voting_complete?
    number_of_yes_votes > (User.count / 2) || number_of_no_votes > (User.count / 2)
  end

  def voting_result_yes?
    number_of_yes_votes > number_of_no_votes
  end

  def check_status
    if voting_complete?
      if voting_result_yes?
        issue_fine
      else
        reject_fine
      end
    else
      reset
    end
  end

private
  def set_fine_amount
    self.amount = FINE_AMOUNT
  end
end