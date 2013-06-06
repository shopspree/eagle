class ActivityActivityObject < ActiveRecord::Base
  attr_accessible :activity_id, :activity_object_id

  belongs_to :activity
  belongs_to :activity_object
end
