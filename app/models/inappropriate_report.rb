class InappropriateReport < ActiveRecord::Base

  belongs_to :taggable, polymorphic: true
  belongs_to :hashtag, counter_cache: true

  attr_accessible :report_type, :reportable_id, :reportable_type, :actor_id
end
