class StocksController < ApplicationController

  def index
  end

  def new_stock
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

  private
    def stock_params
      params.require(:stock).permit(:code,:name,:stock_type,:current_price,:opening_price,:day_high,:day_low,:sold_count,:created_at,:updated_at)
    end




end
