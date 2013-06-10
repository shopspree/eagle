class GroupActor < ActiveRecord::Base
  belongs_to :group
  belongs_to :actor

  attr_accessible :actor_id, :group_id

end
