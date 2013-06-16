class Audience < ActiveRecord::Base

  belongs_to :audienceable, polymorphic: true

  attr_accessible :type, :audienceable_id, :audienceable_type

  validates :type, presence: true#, inclusion: { in: }
  validates :audienceable_id, presence: true
  validates :audienceable_type, presence: true

  TYPES = {
      public: "public",
      organization: "organization",
      team: "team",
      only_me: "only_me",
      custom: "custom"
  }
end