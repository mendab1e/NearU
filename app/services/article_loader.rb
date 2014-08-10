class ArticleLoader
  def load_from_file(path)
    puts "Making bigrams from #{path}"
    text = File.read(path).gsub("\n", " ")
    text = SemanticAnalyzer.new(text).clear_text
    bigrams = SemanticAnalyzer.build_bigrams(text).ngrams_of_all_data[2]
    bigrams.each do |bigram, count|
      dictionary = Dictionary.find_by_bigram(bigram)
      dictionary ||= Dictionary.new(bigram: bigram)
      dictionary.count += count
      dictionary.save
    end
  end

  def load_all_files_from_texts
    files = Dir[File.join(Rails.root, 'texts', '*')]
    files.each{ |f| load_from_file(f) }
  end
end