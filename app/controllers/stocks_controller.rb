class StocksController < ApplicationController

  def index
    @stocks = Stock.all
  end

  def new
    @stock = Stock.new
  end

  def create
    @stock = Stock.new(stock_params)
    @stock.save
    redirect_to @stock
  end

  def show
    @stock = Stock.find(params[:id])
  end

  def buy
    stockNumber = params[:stock]["stock_count"]
    result = current_user.buy(params[:id], stockNumber)
    if result == true
      result = '{"result": "successfull"}'
    else
      tmp = result
      result = '{"result" : "failed", "error": "' + tmp + '"}'
    end
    render :json => JSON.parse(result)
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

  def nse
    @stocks = Stock.where(stock_type: 0)
  end

  def nasdaq
    @stocks = Stock.where(stock_type: 1)
  end


  private
    def stock_params
      params.require(:stock).permit(:code,:name,:stock_type,:current_price,:opening_price,:day_high,:day_low,:sold_count,:created_at,:updated_at)
    end

    def set_stock
      @stock = Stock.find(params[:id])
    end


end
