class Actor < ActiveRecord::Base
  attr_accessible :user_id

  has_many :posts
  has_many :comments
  has_many :notifications
  has_many :activities, through: :activity_actors
  has_many :groups, through: :group_actors
  has_one :profile

  belongs to :user

end
