class Meetup < ActiveRecord::Base
  has_many :memberships
  has_many :users, through: :memberships
  belongs_to :user

  validates :name, presence: true
  validates :location_name, presence: true
  validates :language, presence: true
  validates :date, presence: true
  validates :time, presence: true
  validates :description, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :address, presence: true
  validates :zip, presence: true, length: {is: 5}, numericality: true
  validates :user_id, presence: true, numericality: true
end
