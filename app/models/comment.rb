class Comment < ActiveRecord::Base
  has_many :activity_objects, as: :timelineable
  has_many :likes, as: :likeable
  has_many :comments, as: :commentable
  has_many :mentions, as: :mentionable
  has_many :tags, as: :taggable

  belongs_to :actor
  belongs_to :commentable, polymorphic: true, counter_cache: true

  attr_accessible :actor_id, :commentable_id, :commentable_type, :comments_count, :likes_count, :content

  validates :actor_id, presence: true
end
