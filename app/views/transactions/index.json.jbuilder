json.array!(@transactions) do |transaction|
  json.extract! transaction, :id, :user_id, :stock_id, :stock_value, :stock_count, :transaction_type
  json.url transaction_url(transaction, format: :json)
end
