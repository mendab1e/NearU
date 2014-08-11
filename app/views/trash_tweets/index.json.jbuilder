json.array!(@trash_tweets) do |trash_tweet|
  json.extract! trash_tweet, :id, :long, :lat, :user_screen_name, :text, :tweet_created_at, :user_id
  json.url trash_tweet_url(trash_tweet, format: :json)
end
