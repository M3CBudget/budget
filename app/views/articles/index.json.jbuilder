json.array!(@articles) do |article|
  json.extract! article, :id, :name, :price, :active, :category_id
  json.url article_url(article, format: :json)
end
