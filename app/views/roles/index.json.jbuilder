json.array!(@roles) do |role|
  json.extract! role, :name, :game_id
  json.url role_url(role, format: :json)
end
