class AddReportsCountToPost < ActiveRecord::Migration
  def change
    add_column :posts, :reports_count, :integer, default: 0

    Post.reset_column_information
    Post.al.each do |post|
      Post.update_counters post.id, reports_count: post.inappropriate_reports.count
    end
  end
end
