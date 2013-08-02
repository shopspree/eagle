class Actor < ActiveRecord::Base
  has_many :posts
  has_many :comments
  has_many :likes
  has_many :notifications
  has_many :activity_actors
  has_many :activities, through: :activity_actors

  belongs_to :actorable, polymorphic: true
  belongs_to :context

  attr_accessible :user_id, :notifications_count, :context_id

  validates :actorable_id, presence: true
  validates :actorable_type, presence: true
  validates :context_id, presence: true

end
