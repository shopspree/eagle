class Media < ActiveRecord::Base
  attr_accessible :media_type_id, :post_id, :url_string

  belongs_to :post
  belongs_to :media_type

end
