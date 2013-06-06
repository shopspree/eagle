class Like < ActiveRecord::Base
  attr_accessible :actor_id, :likeable_id, :likeable_type

  has_one :activity_object, as: :timelineable

  belongs_to :actor
  belongs_to :likeable, polymorphic: true
end
