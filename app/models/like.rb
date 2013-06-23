class Like < ActiveRecord::Base

  has_one :activity, as: :timelineable, dependent: :destroy

  belongs_to :actor
  belongs_to :likeable, polymorphic: true, counter_cache: true

  attr_accessible :actor_id, :likeable_id, :likeable_type

  validates :actor_id, presence: true, uniqueness: { scope: [:likeable_id, :likeable_type] }
  validates :likeable_id, presence: true
  validates :likeable_type, presence: true

  def post_context
    case likeable_type
      when 'Post'
        self.post
      when 'Comment'
        comment = Comment.find(likeable_id)
        comment.post_context
      else
        nil
    end
  end

  def post
    Post.find(likeable_id) if likeable_type == 'Post'
  end

end
