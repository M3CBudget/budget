json.array!(@articles) do |article|
  json.extract! article, :id, :name, :standard_price, :active_boolean
  json.url article_url(article, format: :json)
end
