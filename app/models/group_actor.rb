class GroupActor < ActiveRecord::Base
  attr_accessible :actor_id, :group_id

  belongs_to :group
  belongs_to :actor

end
