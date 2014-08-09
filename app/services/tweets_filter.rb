class TweetsFilter
  def filter_existed_tweets
    file = File.open(File.join(Rails.root, 'accepted.txt'), "w")
    Tweet.all.find_each do |tweet|
      analyzer = SemanticAnalyzer.new(tweet.text)
      text = analyzer.clear_text
      bigrams = SemanticAnalyzer.build_bigrams(text).ngrams_of_all_data[2]
      weight = 0
      bigrams.each do |bigram, count|
        dictionary = Dictionary.find_by_bigram(bigram)
        weight += dictionary.count * count if dictionary
      end
      file.puts "#{weight} | #{tweet.text}" if weight > 0
    end 
    file.close
  end
end