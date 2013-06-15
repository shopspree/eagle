class Activity < ActiveRecord::Base

  has_many :activity_actors,dependent: :destroy
  has_many :actors, through: :activity_actors

  belongs_to :action
  belongs_to :organization
  belongs_to :activity_object

  attr_accessible :action_id, :activity_object_id, :organization_id

  validates :organization_id, presence: true
  validates :activity_object_id, presence: true

  default_scope order: 'activities.created_at DESC'

end
