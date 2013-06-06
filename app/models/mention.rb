class Mention < ActiveRecord::Base
  attr_accessible :actor_id, :mentionable_id, :mentionable_type

  has_one :activity_object, as: :timelineable
  has_many :mention_actors

  belongs_to :actor
  belongs_to :mentionable, polymorphic: true

end
