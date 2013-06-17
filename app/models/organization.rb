class Organization < ActiveRecord::Base
  has_many :actors
  has_many :groups
  has_many :activities
  has_many :hashtags

  attr_accessible :domain, :name

  before_create :default_values

  validates :domain, presence: true, uniqueness: true
  validates :name, presence: true, uniqueness: true


  protected

  def default_values
    name ||= domain
  end

end
