load 'config.rb'

# Before running this script do
# export RAILS_ROOT=/home/bobo/RubymineProjects/StockXchange_master/

Stock.transaction do
  100.times do |n|
    Stock.create(
        name:"stock#{n+1}",
        code: "stock#{n+1}",
        current_price: "100",
        stock_type: "#{n%2}"
    )
  end
end