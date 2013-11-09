json.array!(@players) do |player|
  json.extract! player, :name, :email
  json.url player_url(player, format: :json)
end
