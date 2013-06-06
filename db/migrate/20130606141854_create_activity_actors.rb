class CreateActivityActors < ActiveRecord::Migration
  def change
    create_table :activity_actors do |t|
      t.integer :activity_id
      t.integer :actor_id

      t.timestamps
    end
  end
end
