class ActivityActor < ActiveRecord::Base
  attr_accessible :activity_id, :actor_id

  belongs_to :activity
  belongs_to :actor

end
