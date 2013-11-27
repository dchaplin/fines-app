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
  has_many :votes, foreign_key: 'voter_id'
  has_many :fines, foreign_key: 'offender_id'

  validates :username, presence: true, uniqueness: true

  has_secure_password

  scope :by_name, order(:username)

  def vote(fine, value)
    vote = if voted?(fine)
             votes.find_by_fine_id(fine.id)
           else
             Vote.new(fine_id: fine.id, voter_id: id)
           end           

    vote.value = value
    vote.save
  end

  def voted?(fine, value=nil)
    value ? votes.exists?(fine_id: fine.id, value: value) : votes.exists?(fine_id: fine.id)
  end 

  def voted_yes?(fine)
    voted?(fine, true)
  end
end