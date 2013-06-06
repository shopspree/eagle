class Activity < ActiveRecord::Base
  attr_accessible :action_id, :activity_object_id, :organization_id
end
