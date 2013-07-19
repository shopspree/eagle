class AddPostIdToPostSubcategory < ActiveRecord::Migration
  def change
    add_column :post_subcategories, :post_id, :integer
    remove_column :post_subcategories, :post_in
  end
end
