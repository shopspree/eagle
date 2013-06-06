class Post < ActiveRecord::Base
  attr_accessible :actor_id, :content

  has_many :medias
  has_many :activity_objects, as: :timelineable
  has_many :likes, as: :likeable
  has_many :comments, as: :commentable
  has_many :mentions, as: :mentionable
  has_many :hashtags, as: :hashtagable

  belongs_to :actor

end
