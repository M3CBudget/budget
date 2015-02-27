json.array!(@baskets) do |basket|
  json.extract! basket, :id, :notice, :amount, :document, :user_id, :payment_id, :vendor_id
  json.url basket_url(basket, format: :json)
end
