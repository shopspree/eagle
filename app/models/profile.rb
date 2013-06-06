class Profile < ActiveRecord::Base
  attr_accessible :actor_id, :address_id, :birthday, :first_name, :gender, :last_name, :middle_name, :name_prefix, :name_suffix, :organization_id
end
