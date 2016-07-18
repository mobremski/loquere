class Meetup < ActiveRecord::Base
  include PgSearch

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


  pg_search_scope :search_meetup_only,
    against: [:name, :location_name, :address,
      :city, :state, :zip, :date, :time, :language, :description]
  scope :search, -> (query) { search_meetup_only(query) if query.present? }

  def flag
    case language
    when "Spanish"
      "spanish.jpg"
    when "English"
      "english.png"
    when "German"
      "german.png"
    when "Russian"
      "russian.png"
    when "French"
      "french.png"
    else
      "earth.gif"
    end
  end
end
