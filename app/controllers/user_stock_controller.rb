class UserStockController < ApplicationController

  def index
    @stocks = UserStock.all
  end

  def new
    @stock = UserStock.new
  end

  def create
    @stock = UserStock.new(stock_params)
    @stock.save
    redirect_to @stock
  end

  def show
    @stock = UserStock.find(params[:id])
  end

  def getStocks
  	@stocks = UserStock.where(user_id: current_user.id)
  	render :json => @stocks.to_json
  end

  def sell
    stockNumber = params[:stock]["stock_count"]
    result = current_user.sell(params[:id], stockNumber)
    if result == true
      result = '{"result": "successfull}'
    else
      tmp = result
      result = '{"result": "failed", "error": "' + tmp + '"}'
    end
    render :json => JSON.parse(result)
  end

  private
    def stock_params
      params.require(:user_stock).permit(:user_id, :user_id, :stock_id, :stock_id, :stock_value, :stock_count)
    end

    def set_stock
      @stock = Stock.find(params[:id])
    end

end
