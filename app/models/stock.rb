class Stock < ActiveRecord::Base
  has_many :transactions

  # Returns: true | false
  def market_open?
    # Get the stock type and based on the timing on whatever other parameter return if the market to which the given
    # stock belongs is open or not. Make sure this function doesn't fire up any sql query since you already have access
    # to the stock object
    # @kumarshivam675 -> Find the best way to check if the market is open right now or not.
    # Make sure that this is as fast as possible since it will be called every time someone tries to buy a stock.
    # Example:
    # user.buy_stock(1)
    # user.buy_stock would internally call stock.market_open? To check if the market to which stock belongs is open or not.
    # Ruby has a lot of libraries. Try to use them.
  end
end
