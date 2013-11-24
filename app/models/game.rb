class Game < ActiveRecord::Base
  has_many :sessions, :dependent => :restrict # raises ActiveRecord::DeleteRestrictionError
  has_many :participations, through: :sessions
  has_many :players, through: :participations
  has_many :roles, -> { order("name") }, :dependent => :delete_all

  validates :name, presence: true
  validates :max_players, numericality: { greater_than: 0 }
end
