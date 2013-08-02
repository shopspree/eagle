class Person < ActiveRecord::Base
  has_many :associations, dependent: :destroy
  has_many :groups, through: :associations
  has_many :follows, class_name: "Follower"
  has_many :followers, as: :followable
  has_many :audiences, as: :audienceable
  has_one :job_profile
  has_one :profile
  has_one :actor, as: :actorable

  belongs_to :context

  attr_accessible :actor_id, :context_id

  validates_uniqueness_of :actor_id
  validates_presence_of :context_id

end
