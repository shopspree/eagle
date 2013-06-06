class Notification < ActiveRecord::Base
  attr_accessible :activity_id, :actor_id, :is_read
end
