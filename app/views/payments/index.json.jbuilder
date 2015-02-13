json.array!(@payments) do |payment|
  json.extract! payment, :id, :name, :active, :account_id
  json.url payment_url(payment, format: :json)
end
