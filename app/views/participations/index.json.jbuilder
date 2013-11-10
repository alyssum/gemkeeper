json.array!(@participations) do |participation|
  json.extract! participation, :session_id, :player_id, :role_id, :score, :has_won
  json.url participation_url(participation, format: :json)
end
