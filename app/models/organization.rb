class Organization < ActiveRecord::Base
  has_many :actors
  has_many :groups
  has_many :activities
  has_many :hashtags

  attr_accessible :name

  validates :name, presence: true

end
