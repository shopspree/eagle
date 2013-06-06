class Comment < ActiveRecord::Base
  attr_accessible :actor_id, :commentable_id, :commentable_type, :content

  has_many :activity_objects, as: :timelineable
  has_many :likes, as: :likeable
  has_many :comments, as: :commentable
  has_many :mentions, as: :mentionable
  has_many :hashtags, as: :hashtagable

  belongs_to :actor
  belongs_to :commentable, polymorphic: true
end
