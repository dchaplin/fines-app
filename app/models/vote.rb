# == Schema Information
#
# Table name: votes
#
#  id         :integer          not null, primary key
#  voter_id   :integer
#  fine_id    :integer
#  value      :boolean
#  created_at :datetime
#  updated_at :datetime
#

class Vote < ActiveRecord::Base
  belongs_to :voter, class_name: "User", foreign_key: :voter_id
  belongs_to :fine, foreign_key: :fine_id
end
