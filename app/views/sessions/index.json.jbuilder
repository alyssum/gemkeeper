json.array!(@sessions) do |session|
  json.extract! session, :game_id, :date, :is_stalemate, :comments
  json.url session_url(session, format: :json)
end
