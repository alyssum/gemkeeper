class Participation < ActiveRecord::Base
  belongs_to :session
  belongs_to :player
  belongs_to :role
end
