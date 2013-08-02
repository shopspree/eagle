class Follower < ActiveRecord::Base
  belongs_to :followable, polymorphic: true
  belongs_to :person

  attr_accessible :person_id, :approved, :followable_id, :followable_type

  validates_presence_of :person_id, :approved, :followable_id, :followable_type
end
