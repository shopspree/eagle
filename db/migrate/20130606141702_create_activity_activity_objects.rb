class CreateActivityActivityObjects < ActiveRecord::Migration
  def change
    create_table :activity_activity_objects do |t|
      t.integer :activity_id
      t.integer :activity_object_id

      t.timestamps
    end
  end
end
