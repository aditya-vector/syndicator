json.array!(@feeds) do |feed|
  json.extract! feed, :id, :location
  json.url feed_url(feed, format: :json)
end
