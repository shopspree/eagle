class Activity < ActiveRecord::Base
  has_many :actors, through: :activity_actors
  has_one :activity_object, through: :activity_activity_objects

  belongs_to :action
  belongs_to :activity_object
  belongs_to :organization

  attr_accessible :action_id, :activity_object_id, :organization_id

  validates :organization_id, presence: true

  default_scope order: 'acivities.created_at DESC'

end
