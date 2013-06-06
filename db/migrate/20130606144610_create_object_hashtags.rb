class CreateObjectHashtags < ActiveRecord::Migration
  def change
    create_table :object_hashtags do |t|
      t.integer :hashtag_id
      t.integer :hashtagable_id
      t.string :hashtagable_type

      t.timestamps
    end
  end
end
