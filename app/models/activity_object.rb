class ActivityObject < ActiveRecord::Base

  has_one :activity, dependent: :destroy

  belongs_to :timelineable, polymorphic: true

  attr_accessible :timelineable_id, :timelineable_type

  #before_destroy :destroy_activities

  def destroy_activities
    self.activities.delete_all if self.destroyed?
  end

end
