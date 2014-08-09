namespace :tweet_loader do
  desc 'Loads tweets from Moscow'
  task load_moscow: :environment do
    TweetLoader.new.get_tweets_in_moscow
  end
end