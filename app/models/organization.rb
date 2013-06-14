class Organization < ActiveRecord::Base
  has_many :actors
  has_many :groups
  has_many :activities
  has_many :hashtags

  attr_accessible :domain, :name

  before_create :create_name

  validates :domain, presence: true


  protected

  def create_name
    name = domain unless name
  end

end
