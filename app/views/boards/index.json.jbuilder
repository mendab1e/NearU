json.array!(@boards) do |board|
  json.extract! board, :id, :text, :full_text, :url, :payed_until, :lat, :long
  json.url board_url(board, format: :json)
end
