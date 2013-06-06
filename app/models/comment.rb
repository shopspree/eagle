class Comment < ActiveRecord::Base
  attr_accessible :actor_id, :commentable_id, :commentable_type, :content
end
