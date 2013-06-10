class Notification < ActiveRecord::Base
  belongs_to :actor
  belongs_to :activity

  attr_accessible :activity_id, :actor_id, :is_read

end
