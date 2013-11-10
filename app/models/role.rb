class Role < ActiveRecord::Base
  belongs_to :game
  has_many :sessions, through: :participations
  has_many :participations
  has_many :players, through: :participations
end
