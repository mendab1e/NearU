class CreateTrashTweets < ActiveRecord::Migration
  def change
    create_table :trash_tweets do |t|
      t.float :long
      t.float :lat
      t.string :user_screen_name
      t.string :text
      t.datetime :tweet_created_at
      t.string :user_id

      t.timestamps
    end

    add_index :trash_tweets, [:long, :lat, :tweet_created_at], unique: false
  end
end
