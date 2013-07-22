class AudienceType < ActiveRecord::Base

  has_many :audiences, dependent: :destroy
  has_many :audienceable, through: :audience

  attr_accessible :name

  validates :name, uniqueness: true


  public

  PUBLIC = 'Public'
  ORGANIZATION = 'Organization'
  TEAM = 'Team'
  ONLY_ME = 'OnlyMe'
  CUSTOM = 'Custom'

end