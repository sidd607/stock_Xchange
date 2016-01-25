json.array!(@portfolios) do |portfolio|
  json.extract! portfolio, :id, :user_id, :stock_id, :stock_value, :stock_count
  json.url portfolio_url(portfolio, format: :json)
end
