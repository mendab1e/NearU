namespace :articles_analyzer do
  desc 'Loads all articles from texts directory and make bigrams from them'
  task load_all: :environment do
    ArticleLoader.new.load_all_files_from_texts
  end
end