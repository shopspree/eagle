class Comment < ActiveRecord::Base
  has_one :activity_object, as: :timelineable, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :mentions, as: :mentionable, dependent: :destroy
  has_many :tags, as: :taggable, dependent: :destroy

  belongs_to :actor
  belongs_to :commentable, polymorphic: true, counter_cache: true

  attr_accessible :actor_id, :commentable_id, :commentable_type, :comments_count, :likes_count, :content

  validates :actor_id, presence: true
end
