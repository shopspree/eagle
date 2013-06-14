class AddActivityObjectIdToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :activity_object_id, :string
  end
end
