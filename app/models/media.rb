class Media < ActiveRecord::Base
  attr_accessible :media_type_id, :post_id, :url_string
end
