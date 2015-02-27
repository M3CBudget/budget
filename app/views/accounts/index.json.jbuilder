json.array!(@accounts) do |account|
  json.extract! account, :id, :number, :bic, :name, :active, :user_id
  json.url account_url(account, format: :json)
end
