class Post < ActiveRecord::Base

  has_many :medias
  has_many :activity_objects, as: :timelineable
  has_many :likes, as: :likeable
  has_many :comments, as: :commentable
  has_many :mentions, as: :mentionable
  has_many :tags, as: :taggable

  belongs_to :actor

  attr_accessible :actor_id, :comments_count, :likes_count, :content

  validates :actor_id, presence: true

  scope :popular, lambda { where("created_at > ?", 7.days.ago) }

  #scope :posts_by_user_id, lambda { |id| where(actor_id: id) }

end
