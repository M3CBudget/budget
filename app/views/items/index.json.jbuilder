json.array!(@items) do |item|
  json.extract! item, :id, :basket_id, :category_id, :article_id, :user_id, :name, :quantity, :notice, :income, :expense, :period, :launch, :finish
  json.url item_url(item, format: :json)
end
