class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :actor_id
      t.integer :likeable_id
      t.string :likeable_type

      t.timestamps
    end
  end
end
