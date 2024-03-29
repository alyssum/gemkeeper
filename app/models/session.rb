class Session < ActiveRecord::Base
  belongs_to :game
  belongs_to :creator, :class_name => 'User', :foreign_key => 'created_by'
  has_many :participations, :dependent => :delete_all
  has_many :players, through: :participations
  has_many :roles, through: :participations

  validates :game_id, presence: true
  validates :date, presence: true

end
