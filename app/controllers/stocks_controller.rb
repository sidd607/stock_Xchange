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
    @stock = Stock.find(params[:id])
    @me = current_user
    brokerage = 10 #percent
    transactionAmmount = params[:number].to_i*(@stock.current_price)
    transactionAmmount = transactionAmmount + (0.1)*transactionAmmount
    if transactionAmmount > @me.balance
      reply = JSON.parse('{"result" : "failed", "error" : "not enough money"}')
    else 
      @userStock = UserStock.new
      @userStock.user_id = @me.id
      @userStock.stock_id = @stock.id
      @userStock.stock_value = @stock.current_price
      @userStock.stock_count = params[:number].to_i
      if @userStock.save
        reply = JSON.parse('{"result" : "success"}')
      else
        reply = JSON.parse('{"result" : "failed", "error" : "could not save"}')
      end
      
      @me.balance = @me.balance - transactionAmmount
      puts @me.balance
      puts transactionAmmount
      if @me.save
        reply = JSON.parse('{"result" : "success"}')
      else
        reply = JSON.parse('{"result" : failed, "error" : "could not update user balance"}')
      end
    end
    render :json => reply
  end

  private
    def stock_params
      params.require(:stock).permit(:code,:name,:stock_type,:current_price,:opening_price,:day_high,:day_low,:sold_count,:created_at,:updated_at)
    end

    def set_stock
      @stock = Stock.find(params[:id])
    end


end
