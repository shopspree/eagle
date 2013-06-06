class MentionActor < ActiveRecord::Base
  attr_accessible :actor_id, :mention_id

  belongs_to :mention
  belongs_to :actor

end
