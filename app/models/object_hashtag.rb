class ObjectHashtag < ActiveRecord::Base
  attr_accessible :hashtag_id, :hashtagable_id, :hashtagable_type

  belongs_to :hashtagable, polymorphic: true
  belongs_to :hashtag

end
