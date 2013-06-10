class Like < ActiveRecord::Base
  has_one :activity_object, as: :timelineable

  belongs_to :actor
  belongs_to :likeable, polymorphic: true, counter_cache: true

  attr_accessible :actor_id, :likeable_id, :likeable_type

  validates :actor_id, presence: true
end
