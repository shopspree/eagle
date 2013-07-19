class PostSubcategory < ActiveRecord::Base

  belongs_to :post
  belongs_to :subcategory

  attr_accessible :post_id, :subcategory_id
end
