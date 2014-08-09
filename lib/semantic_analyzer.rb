class SemanticAnalyzer
  def initialize(text)
    @text = text
  end
  
  def clear_text
    words = remove_symbols(@text).mb_chars.downcase.to_s.split
    words_without_stops = remove_stop_words(words)
    stemmed_words = stem_words(words_without_stops, 'ru')
    
    stemmed_words.join(' ')
  end
  
  def self.build_bigrams(text)
    text = [text] if text.is_a?(String)
    n_gram = NGram.new(text, n: 2)
  end
  
  def self.stop_words
    %w(- еще него сказать а ж нее со без же ней совсем более жизнь нельзя так больше за нет такой будет зачем ни там будто здесь нибудь тебя бы и никогда тем был из ним теперь была из-за них то были или ничего тогда было им но того быть иногда ну тоже в их о только вам к об том вас кажется один тот вдруг как ы он три ведь какая она тут во какой они ты вот когда опять у впрочем конечно от уж все которого перед уже всегда которые по хорошо всего кто под хоть всех куда после чего всю ли потом человек вы лучше потому чем г между почти через где меня при что говорил мне про чтоб да много раз чтобы даже может разве чуть два можно с эти для мой сам этого до моя свое этой другой мы свою этом его на себе этот ее над себя эту ей надо сегодня я ему наконец сейчас если нас сказал есть не сказала im in or and i at w with for as he she it her him them us our their your me &amp; &)
  end
  
  private
  
  def stem_words(words, lang)
    stemmer = Lingua::Stemmer.new(language: lang)
    words.map{ |word| stemmer.stem(word) }
  end
  
  def remove_symbols(text)
    syms = %w(0 1 2 3 4 5 6 7 8 9 . , ! @ ? # ; : ' " / ( ) « » + - —)
    new_text = String.new(text)
    syms.each{ |s| new_text.gsub!(s, '')}

    new_text
  end
  
  def remove_stop_words(words)
    words.delete_if{ |word| SemanticAnalyzer.stop_words.include?(word) }
  end
end