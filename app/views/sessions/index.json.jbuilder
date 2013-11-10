json.array!(@sessions) do |session|
  json.extract! session, :game_id, :date, :comments
  json.url session_url(session, format: :json)
end
