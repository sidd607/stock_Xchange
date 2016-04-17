load 'config.rb'

def update
	userData = Hash.new
	stockData = Hash.new
	
	users = User.all()
		
	stocks = Stock.all()
	stocks.each do |stock|
		#puts stock.name
		stockData[stock.id] = stock.current_price  #creating a hash  which stores stock_id, current_price as key value pair
	end
	
	UserStock.transaction do
		userstocks = UserStock.all()
		users.each do |user|
			user.net_worth = user.balance		# net worth equals users current balance
			user.save!
		end
		
		userstocks.each do |userstock|
			#puts userstock.id
			user = User.find(userstock.user_id)
			user.net_worth += stockData[userstock.stock_id]*userstock.stock_count  # net worth added with stocks_price * stock_count
			user.save!
		end
	end
	
	User.transaction do	
		users = User.all()
		users.each do |user|
			userData[user.id] = user.net_worth
			#puts user.email
		end
		
		i = 1
		sortedUsers = userData.sort_by {|id,net_worth| net_worth}.reverse
		puts sortedUsers
		sortedUsers.each do |sortedUser|
			user = User.find(sortedUser[0])
			user.rank = i
			user.save!
			i += 1
		end
	end
end

#update
