json.array!(@dictionaries) do |dictionary|
  json.extract! dictionary, :id, :bigram, :count, :weight
  json.url dictionary_url(dictionary, format: :json)
end
