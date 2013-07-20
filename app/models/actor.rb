class Actor < ActiveRecord::Base
  has_many :posts
  has_many :comments
  has_many :likes
  has_many :notifications
  has_many :activity_actors
  has_many :activities, through: :activity_actors
  has_many :groups, through: :group_actors
  has_many :group_actors
  has_one :job_profile
  has_one :profile

  belongs_to :user
  belongs_to :context

  attr_accessible :user_id, :context_id

  validates :user_id, presence: true
  validates :context_id, presence: true

end
