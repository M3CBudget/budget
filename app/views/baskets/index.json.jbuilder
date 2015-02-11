json.array!(@baskets) do |basket|
  json.extract! basket, :id, :notice, :amount, :document
  json.url basket_url(basket, format: :json)
end
