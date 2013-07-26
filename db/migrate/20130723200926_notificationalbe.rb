class Notificationalbe < ActiveRecord::Migration
  def up
    rename_column :notifications, :notification_id, :notificationable_id
    rename_column :notifications, :notification_type, :notificationable_type
  end

  def down
    rename_column :notifications, :notificationable_id, :notification_id
    rename_column :notifications, :notificationable_type, :notification_type
  end
end
