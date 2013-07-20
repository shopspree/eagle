class Group < ActiveRecord::Base
  has_many :actors, through: :group_actors
  has_many :group_actors

  belongs_to :group_type
  belongs_to :context

  attr_accessible :group_type, :name, :context_id

  validates :name, presence: true
  validates :context_id, presence: true

end
