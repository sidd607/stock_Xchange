require 'rubygems'
require 'active_record'
require 'mysql2'
ActiveRecord::Base.establish_connection(
:adapter => "mysql2",
:host => "127.0.0.1",
:database => "stockxchange2016"
)

$userData = Hash.new
$stockData = Hash.new

class User < ActiveRecord::Base
	@users = User.all()
	@users.each do |user|
		#puts user.email
		$userData[user.id] = user.net_worth		# creating a hash which stores user_id,networth as key, value pair
	end
	#puts $userData[2]
end

class Stock < ActiveRecord::Base
	@stocks = Stock.all()
	@stocks.each do |stock|
		puts stock.name
		$stockData[stock.id] = stock.current_price  #creating a hash  which stores stock_id, current_price as key value pair
	end
	#puts $stockData[2]
end

class Portfolio < ActiveRecord::Base
	Portfolio.transaction do					# transaction begins
		@portfolios = Portfolio.all()
		@users = User.all()
		@users.each do |user|
			user.net_worth = user.balance		# net worth equals users current balance
			user.save!
		end

		@portfolios.each do |portfolio|
			#puts portfolio.id
			@user = User.find(portfolio.user_id)
			@user.net_worth += $stockData[portfolio.stock_id]*portfolio.stock_count  # net worth added with stocks_price * stock_count
			@user.save!
		end
	end											# transaction ends
end
