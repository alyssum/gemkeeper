class Session < ActiveRecord::Base
  belongs_to :game
  has_many :participations
  has_many :players, through: :participations
  has_many :roles, through: :participations

  validates :game_id, presence: true
  validates :date, presence: true
  validates_associated :participations

  accepts_nested_attributes_for :participations
end
