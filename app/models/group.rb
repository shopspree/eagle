class Group < ActiveRecord::Base
  attr_accessible :group_type, :name, :organization_id

  has_many :actors, through: :group_actors

  belongs_to :group_type
  belongs_to :organization
end
