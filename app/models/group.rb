class Group < ActiveRecord::Base
  attr_accessible :group_type, :name, :organization_id
end
