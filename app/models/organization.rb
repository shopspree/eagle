class Organization < ActiveRecord::Base
  has_many :people
  has_many :groups
  has_many :job_profiles
  has_many :domains, dependent: :destroy

  attr_accessible :name

  validates :name, presence: true, uniqueness: true

end
