json.array!(@tweets) do |tweet|
  json.extract! tweet, :id, :long, :lat, :user_screen_name, :text, :tweet_created_at, :user_id
  # json.url tweet_url(tweet, format: :json)
end
