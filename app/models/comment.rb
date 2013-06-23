class Comment < ActiveRecord::Base

  has_many :likes, as: :likeable, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :mentions, as: :mentionable, dependent: :destroy
  has_many :tags, as: :taggable, dependent: :destroy
  has_one :activity, as: :timelineable, dependent: :destroy

  belongs_to :actor
  belongs_to :commentable, polymorphic: true, counter_cache: true

  attr_accessible :actor_id, :commentable_id, :commentable_type, :comments_count, :likes_count, :content

  validates :actor_id, presence: true
  validates :content, length: { minimum: 1 }


  def post_context
    case likeable_type
      when 'Post'
        self.post
      when 'Comment'
        comment = Comment.find(commentable_id)
        comment.post_context
      else
        nil
    end
  end

  def post
    Post.find(commentable_id) if commentable_type == 'Post'
  end

end
