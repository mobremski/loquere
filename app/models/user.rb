class User < ActiveRecord::Base
  has_many :memberships, dependent: :destroy
  has_many :meetups, through: :memberships
  has_many :meetups, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable



  validates :email, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :screen_name, presence: true
  validates :encrypted_password, presence: true
end
