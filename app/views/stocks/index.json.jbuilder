json.array!(@stocks) do |stock|
  json.extract! stock, :code, :name, :stock_type, :current_price
  json.url stocks_url(stock, format: :json)
end
