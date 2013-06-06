class Notification < ActiveRecord::Base
  attr_accessible :activity_id, :actor_id, :is_read

  belongs_to :actor
  belongs_to :activity

end
