class Like < ActiveRecord::Base

  has_one :activity, as: :timelineable, dependent: :destroy

  belongs_to :actor
  belongs_to :likeable, polymorphic: true, counter_cache: true

  attr_accessible :actor_id, :likeable_id, :likeable_type

  validates :actor_id, presence: true, uniqueness: { scope: [:likeable_id, :likeable_type] }
  validates :likeable_id, presence: true
  validates :likeable_type, presence: true

  def post(like = self)
    if likeable_type == 'Post'
      Post.find(likeable_id)
    else
      like = Like.find(likeable_id)
      self.post(like)
    end
  end

end
