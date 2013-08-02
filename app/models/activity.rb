class Activity < ActiveRecord::Base

  has_many :activity_actors,dependent: :destroy
  has_many :actors, through: :activity_actors
  #has_one :owner, class_name: "Actor"

  belongs_to :action
  belongs_to :context
  belongs_to :timelineable, polymorphic: true

  attr_accessible :action_id, :timelineable_id, :timelineable_type, :context_id

  validates :context_id, presence: true
  validates :timelineable_id, presence: true
  validates :timelineable_type, presence: true

  DEFAULT_ORDER = 'activities.created_at DESC'

  default_scope order: DEFAULT_ORDER

  scope :timeline, lambda { |context_id| where(context_id: context_id).includes(:timelineable).order(DEFAULT_ORDER) }

  #def self.from_users_followed_by(user)
    #followed_user_ids = "SELECT followed_id FROM follower WHERE person_id = :person_id"
    #where("user_id IN (#{followed_user_ids}) OR user_id = :user_id", user_id: user.id)
  #end

  def post
    timelineable if timelineable.is_a? Post
  end

  def like
    timelineable if timelineable.is_a? Like
  end

  def comment
    timelineable if timelineable.is_a? Comment
  end

end
