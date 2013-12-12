# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string(255)
#  password_digest :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  admin           :boolean
#

class User < ActiveRecord::Base
  class VotedAlready < StandardError; end

  has_many :votes, foreign_key: 'voter_id'
  has_many :fines, foreign_key: 'offender_id'

  validates :username, presence: true, uniqueness: true

  has_secure_password

  scope :by_name, ->{ order(:username) }

  def vote(fine, value)
    if voted?(fine)
      vote = votes.find_by_fine_id(fine.id)
      if vote.value == value
        raise VotedAlready.new("Voted #{value} already!")
      else
        vote.destroy
      end
    else
      vote = Vote.new(fine_id: fine.id, voter_id: id)
      vote.value = value
      vote.save
    end           
  end

  def voted?(fine, value = nil)
    if value      
      votes.exists?(fine_id: fine.id, value: value) 
    else
      votes.exists?(fine_id: fine.id)
    end
    # value ? votes.exists?(fine_id: fine.id, value: value) : votes.exists?(fine_id: fine.id)
  end 

  def voted_yes?(fine)
    voted?(fine, true)
  end
end