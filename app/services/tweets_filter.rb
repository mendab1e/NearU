class TweetsFilter
  def self.acceptable?(tweet)
    analyzer = SemanticAnalyzer.new(tweet.text)
    text = analyzer.clear_text
    bigrams = SemanticAnalyzer.build_bigrams(text).ngrams_of_all_data[2]
    weight = 0
    bigrams.each do |bigram, count|
      dictionary = Dictionary.find_by_bigram(bigram)
      weight += dictionary.count * count if dictionary
    end

    weight > 0 ? true : false
  end

  def filter_existed_tweets
    Tweet.all.find_each do |tweet|
      unless TweetsFilter.acceptable?(tweet)
        tweet.destroy
      end
    end
  end
end