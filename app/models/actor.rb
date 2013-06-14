class Actor < ActiveRecord::Base
  has_many :posts
  has_many :comments
  has_many :likes
  has_many :notifications
  has_many :activity_actors
  has_many :activities, through: :activity_actors
  has_one :profile
  #has_many :groups, through: :group_actors

  belongs_to :user
  belongs_to :organization

  attr_accessible :user_id, :organization_id

  validates :user_id, presence: true
  validates :organization_id, presence: true

end
