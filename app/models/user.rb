class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :player, autosave: true
  has_many :sessions, :foreign_key => 'created_by'

  accepts_nested_attributes_for :player
end
