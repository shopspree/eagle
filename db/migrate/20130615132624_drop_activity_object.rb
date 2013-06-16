class DropActivityObject < ActiveRecord::Migration
  def up
  	drop_table :activity_objects

  end

  def down
  	create_table :activity_objects do |t|
      t.integer :timelineable_id
      t.string :timelineable_type

      t.timestamps
    end
  end
end
