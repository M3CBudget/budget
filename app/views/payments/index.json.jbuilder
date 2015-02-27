json.array!(@payments) do |payment|
  json.extract! payment, :id, :user_id, :number, :bic, :active, :name
  json.url payment_url(payment, format: :json)
end
