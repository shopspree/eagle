class Profile < ActiveRecord::Base
  belongs_to :actor
  belongs_to :address

  attr_accessible :actor_id, :address_id, :birthday, :first_name, :gender, :last_name, :middle_name, :name_prefix, :name_suffix, :email, :picture_url, :thumbnail_url

  validates :actor_id, presence: true
  validates :first_name, presence: true


  protected

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
