class Mention < ActiveRecord::Base
  has_one :activity_object, as: :timelineable
  has_many :mention_actors

  belongs_to :actor
  belongs_to :mentionable, polymorphic: true

  attr_accessible :actor_id, :mentionable_id, :mentionable_type

  def post(mention = self)
    if mentionable_type == 'Post'
      Post.find(mentionable_id)
    else
      mention = Mention.find(mentionable_id)
      self.post(mention)
    end
  end

end
