class Player < ActiveRecord::Base
  has_many :games, through: :sessions
  has_many :sessions, through: :participations
  has_many :participations
  has_many :roles, through: :participations

  validates :name, presence: true
end
