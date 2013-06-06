class ActivityObject < ActiveRecord::Base
  attr_accessible :timelineable_id, :timelineable_type

  has_many :activities, through: :activity_activity_objects

  belongs_to :timelineable, polymorphic: true

end
