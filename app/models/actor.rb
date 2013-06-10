class Actor < ActiveRecord::Base
  has_many :posts
  has_many :comments
  has_many :notifications
  has_many :activities, through: :activity_actors
  has_many :groups, through: :group_actors
  has_one :profile

  belongs to :user

  attr_accessible :user_id

  #validates :user_id, presence: true

end
