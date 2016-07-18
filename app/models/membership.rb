class Membership < ActiveRecord::Base
  belongs_to :meetup
  belongs_to :user

  validates :user_id, presence: true, uniqueness: true
  validates :meetup_id, presence: true, uniqueness: true
end
