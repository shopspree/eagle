class Profile < ActiveRecord::Base
  belongs_to :actor
  belongs_to :organization
  belongs_to :address

  attr_accessible :actor_id, :address_id, :birthday, :first_name, :gender, :last_name, :middle_name, :name_prefix, :name_suffix, :organization_id, :email, :thumbnail_url_string

  before_validation :default_values

  validates :actor_id, presence: true
  validates :organization_id, presence: true

  protected

  def default_values
    org = Organization.find_by_domain(domain email);
    org_id = org.id if org
    self.organization_id ||=  org_id
  end


  def domain(email)
    email.split("@").last if email
  end

  def first_name
    read_attribute(:first_name).try(:titleize)
  end

  def middle_name
    read_attribute(:middle_name).try(:titleize)
  end

  def last_name
    read_attribute(:last_name).try(:titleize)
  end

end
