class Mention < ActiveRecord::Base
  attr_accessible :actor_id, :mentionable_id, :mentionable_type
end
