class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :content
      t.integer :actor_id
      t.integer :commentable_id
      t.string :commentable_type

      t.timestamps
    end
  end
end
