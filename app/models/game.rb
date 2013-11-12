class Game < ActiveRecord::Base
  has_many :sessions
  has_many :participations, through: :sessions
  has_many :players, through: :participations
  has_many :roles, :dependent => :delete_all
  accepts_nested_attributes_for :roles, allow_destroy: true

  validates :name, presence: true
  validates :max_players, numericality: { greater_than: 0 }
  validates_associated :roles
end
