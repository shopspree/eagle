class Hashtag < ActiveRecord::Base
  attr_accessible :actor_id, :key, :organization_id, :value
end
