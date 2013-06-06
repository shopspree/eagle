class CreateActivityObjects < ActiveRecord::Migration
  def change
    create_table :activity_objects do |t|
      t.integer :timelineable_id
      t.string :timelineable_type

      t.timestamps
    end
  end
end
