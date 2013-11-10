class Game < ActiveRecord::Base
  has_many :sessions
  has_many :participations, through: :sessions
  has_many :players, through: :participations
  has_many :roles
end
