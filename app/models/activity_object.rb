class ActivityObject < ActiveRecord::Base
  attr_accessible :timelineable_id, :timelineable_type
end
