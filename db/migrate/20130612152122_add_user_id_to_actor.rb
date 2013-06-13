class AddUserIdToActor < ActiveRecord::Migration
  def change
    add_column :actors, :user_id, :integer
  end
end
