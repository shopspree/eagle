class ActivityActivityObject < ActiveRecord::Base
  belongs_to :activity
  belongs_to :activity_object

  attr_accessible :activity_id, :activity_object_id

end
