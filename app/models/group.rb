class Group < ActiveRecord::Base
  has_many :actors, through: :group_actors

  belongs_to :group_type
  belongs_to :organization

  attr_accessible :group_type, :name, :organization_id

  validates :name, presence: true

end
