class ActivityObject < ActiveRecord::Base
  has_many :activities, through: :activity_activity_objects

  belongs_to :timelineable, polymorphic: true

  attr_accessible :timelineable_id, :timelineable_type

end
