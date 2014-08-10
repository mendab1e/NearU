class TweetLoader
  def self.streaming
    @streaming_twitter ||= Twitter::Streaming::Client.new do |config|
      config.consumer_key        = "PykDIMQvz825frbxcMrJD5OyC"
      config.consumer_secret     = "9zhVSScb6mBLdeR7YjWO0EycvLNdStKXotZdOLKFeS78EnMo2u"
      config.access_token        = "68958452-fnFUGD8icHbcPyz2Yz32iXXsYEiN6WzYcJ1h0K3S9"
      config.access_token_secret = "yvsLdPAKIoRW0UpXYwlLhcSM6hugpXIztAePzbNwr2ffW"
    end
  end

  def get_tweets_in_moscow
    get_tweets_by_geo_square('37.37847', '55.59171', '37.83989', '55.89781')
  end

  def get_tweets_by_geo_square(lat1, long1, lat2, long2)
    TweetLoader.streaming.filter(:locations => "#{lat1},#{long1},#{lat2},#{long2}") do |tweet|
      if acceptable?(tweet)
        write_to_db(tweet)
        write_to_console(tweet)
      end
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
    return false unless TweetsFilter.new.acceptable?(tweet)

    return true
  end

  def write_to_db(tweet)
    Tweet.create(user_screen_name: tweet.user.screen_name, user_id: tweet.user.id, text: tweet.text, tweet_created_at: tweet.created_at, lat: tweet.geo.lat, long: tweet.geo.long)
  end

  def write_to_console(tweet)
    puts "user: @#{tweet.user.screen_name}, text: #{tweet.text}, created_at: #{tweet.created_at}, lat: #{tweet.geo.lat}, long: #{tweet.geo.long}, user_id: #{tweet.user.id}\n"
  end
end