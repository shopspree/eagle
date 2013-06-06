class Hashtag < ActiveRecord::Base
  attr_accessible :actor_id, :key, :organization_id, :value

  has_many :object_hashtags

  belongs_to :actor
  belongs_to :organization
end
