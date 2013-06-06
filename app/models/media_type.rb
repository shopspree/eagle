class MediaType < ActiveRecord::Base
  attr_accessible :name

  has_many :medias

end
