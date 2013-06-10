class ActivityActor < ActiveRecord::Base
  belongs_to :activity
  belongs_to :actor

  attr_accessible :activity_id, :actor_id

end
