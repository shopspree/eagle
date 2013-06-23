class Mention < ActiveRecord::Base
  has_one :activity_object, as: :timelineable
  has_many :mention_actors

  belongs_to :actor
  belongs_to :mentionable, polymorphic: true

  attr_accessible :actor_id, :mentionable_id, :mentionable_type

  def post_context
    case mentionable_type
      when 'Post'
        self.post
      when 'Comment'
        comment = Comment.find(mentionable_id)
        comment.post_context
      else
        nil
    end
  end

  def post
    Post.find(mentionable_id) if mentionable_type == 'Post'
  end

end
