class Activity < ActiveRecord::Base

  has_many :activity_actors,dependent: :destroy
  has_many :actors, through: :activity_actors
  has_many :audiences

  belongs_to :action
  belongs_to :context
  belongs_to :activity_object
  belongs_to :timelineable, polymorphic: true

  attr_accessible :action_id, :timelineable_id, :timelineable_type, :context_id

  validates :context_id, presence: true
  validates :timelineable_id, presence: true
  validates :timelineable_type, presence: true

  DEFAULT_ORDER = 'activities.created_at DESC'

  default_scope order: DEFAULT_ORDER

  scope :timeline, lambda { |context_id| where(context_id: context_id).includes(:timelineable).order(DEFAULT_ORDER) }


  def post
    Post.find(timelineable_id) if timelineable_id == 'Post'
  end

  def like
    Like.find(timelineable_id) if timelineable_id == 'Like'
  end

  def comment
    Comment.find(timelineable_id) if timelineable_id == 'Comment'
  end

end
