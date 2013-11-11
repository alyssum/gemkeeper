class Participation < ActiveRecord::Base
  belongs_to :session
  belongs_to :player
  belongs_to :role

  validates :session_id, presence: true
  validates :player_id, presence: true
  validates :role_id, presence: true
  validates :score, presence: true
end
