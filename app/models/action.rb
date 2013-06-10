class Action < ActiveRecord::Base
  has_many :activities

  attr_accessible :name

  validates :name, presence: true

end
