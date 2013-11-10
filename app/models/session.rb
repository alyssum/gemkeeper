class Session < ActiveRecord::Base
  belongs_to :game
  has_many :participations
  has_many :players, through: :participations
  has_many :roles, through: :participations
end
