json.array!(@games) do |game|
  json.extract! game, :name, :max_players
  json.url game_url(game, format: :json)
end
