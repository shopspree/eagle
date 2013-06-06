class CreateGroupActors < ActiveRecord::Migration
  def change
    create_table :group_actors do |t|
      t.integer :group_id
      t.integer :actor_id

      t.timestamps
    end
  end
end
