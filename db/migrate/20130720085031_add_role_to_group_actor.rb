class AddRoleToGroupActor < ActiveRecord::Migration
  def change
    add_column :group_actors, :role, :string
  end
end
