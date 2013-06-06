class Like < ActiveRecord::Base
  attr_accessible :actor_id, :likeable_id, :likeable_type
end
