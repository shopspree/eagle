class Post < ActiveRecord::Base

  has_many :medias, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :mentions, as: :mentionable, dependent: :destroy
  has_many :tags, as: :taggable, dependent: :destroy
  has_many :hashtags, through: :tags
  has_many :inappropriate_reports, as: :reportable, dependent: :destroy
  has_one :activity, as: :timelineable, dependent: :destroy
  has_one :audience, as: :audienceable, dependent: :destroy

  belongs_to :actor

  attr_accessible :actor_id, :comments_count, :likes_count, :content, :user_liked, :reports_count

  scope :popular, lambda { where("created_at > ?", 7.days.ago) }

  #scope :posts_by_user_id, lambda { |id| where(actor_id: id) }

  def is_liked_by?(actor)
    likes.each do |like|
      return true if like.actor == actor
    end

    false
  end

end
