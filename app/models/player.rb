class Player < ActiveRecord::Base
  has_many :games, through: :sessions
  has_many :sessions, through: :participations
  has_many :participations, :dependent => :restrict # raises ActiveRecord::DeleteRestrictionError
  has_many :roles, through: :participations
  belongs_to :user

  validates :name, presence: true
  validates :email, uniqueness: true, presence: true
end
