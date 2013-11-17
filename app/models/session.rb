class Session < ActiveRecord::Base
  belongs_to :game
  has_many :participations, :dependent => :delete_all
  has_many :players, through: :participations
  has_many :roles, through: :participations

  validates :game_id, presence: true
  validates :date, presence: true

end
