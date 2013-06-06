class Activity < ActiveRecord::Base
  attr_accessible :action_id, :activity_object_id, :organization_id

  has_many :actors, through: :activity_actors
  has_many :activity_objects, through: :activity_activity_objects

  belongs_to :action
  belongs_to :activity_object
  belongs_to :organization
end
