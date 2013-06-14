class Profile < ActiveRecord::Base
  belongs_to :actor
  belongs_to :organization
  belongs_to :address

  attr_accessible :actor_id, :address_id, :birthday, :first_name, :gender, :last_name, :middle_name, :name_prefix, :name_suffix, :organization_id, :email

  validates :actor_id, presence: true
  validates :organization_id, presence: true

end
