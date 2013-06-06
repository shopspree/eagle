class Address < ActiveRecord::Base
  attr_accessible :address_type_id, :city, :country, :state, :street, :title, :zipcode

  has_many :profiles

  belongs_to :address_type
end
