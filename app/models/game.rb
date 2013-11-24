class Game < ActiveRecord::Base
  # TODO: Should not be able to delete game if it has sessions
  has_many :sessions
  has_many :participations, through: :sessions
  has_many :players, through: :participations
  has_many :roles, -> { order("name") }, :dependent => :delete_all

  validates :name, presence: true
  validates :max_players, numericality: { greater_than: 0 }
end
