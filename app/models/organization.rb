class Organization < ActiveRecord::Base
  attr_accessible :name

  has_many :actors
  has_many :groups
  has_many :activities
  has_many :hashtags
end
