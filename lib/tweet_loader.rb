class TweetLoader

  def get_tweets_in_moscow
    get_tweets_by_geo_square(Settings.city.moscow)
  end

  def get_tweets
    cities = [Settings.city.moscow, Settings.city.spb, Settings.city.ufa].join(',')
    get_tweets_by_geo_square(cities)
  end

  # long1,lat1,long2,lat2
  def get_tweets_by_geo_square(cities)
    TweetLoader.streaming.filter(:locations => cities) do |tweet|
      if acceptable?(tweet) && tweet_from_place?(tweet, cities)
        if TweetsFilter.acceptable?(tweet)
          write_to_db(tweet)
          # write_to_console(tweet)
        else
          write_to_trash(tweet)
        end
      end
    end
  end

  def self.streaming
    @streaming_twitter ||= Twitter::Streaming::Client.new do |config|
      config.consumer_key        = Settings.twitter.consumer_key
      config.consumer_secret     = Settings.twitter.consumer_secret
      config.access_token        = Settings.twitter.access_token
      config.access_token_secret = Settings.twitter.access_token_secret
    end
  end

  private

  def acceptable?(tweet)
    # Without geo cords
    return false if !tweet.geo.lat.present? || !tweet.geo.long.present?
    # Replies
    return false if tweet.text.first == '@'
    # Instagram
    return false if tweet.text.include?('Опубликовано фото')
    return false if tweet.text.include?('Опубликовано видео')

    return true
  end

  def tweet_from_place?(tweet, cities)
    cities = cities.split(',')
    valid = false
    (cities.count / 4).times do |i|
      if cities[i * 4].to_f - 1 <= tweet.geo.long &&
          tweet.geo.long <= cities[i * 4 + 2].to_f + 1 &&
          cities[i * 4 + 1].to_f - 1 <= tweet.geo.lat &&
          tweet.geo.lat <= cities[i * 4 + 3].to_f + 1
        valid = true
      end
    end

    unless valid
      puts("ALARM #{cities}")
      write_to_console(tweet)
    end
    return valid
  end

  def write_to_trash(tweet)
    TrashTweet.create(
      user_screen_name: tweet.user.screen_name,
      user_id: tweet.user.id,
      text: tweet.text,
      tweet_created_at: tweet.created_at,
      lat: tweet.geo.lat,
      long: tweet.geo.long)
  end

  def write_to_db(tweet)
    Tweet.create(
      user_screen_name: tweet.user.screen_name,
      user_id: tweet.user.id,
      text: tweet.text,
      tweet_created_at: tweet.created_at,
      lat: tweet.geo.lat,
      long: tweet.geo.long)
  end

  def write_to_console(tweet)
    puts "user: @#{tweet.user.screen_name}, text: #{tweet.text}, created_at:
      #{tweet.created_at},  long: #{tweet.geo.long}, lat: #{tweet.geo.lat},
      user_id: #{tweet.user.id}\n"
  end
end