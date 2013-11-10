json.array!(@participations) do |participation|
  json.extract! participation, :session_id, :player_id, :role_id, :score
  json.url participation_url(participation, format: :json)
end
