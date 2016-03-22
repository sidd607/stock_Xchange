#this script will only work if user has specified the name if the stock
#example for infosys it's code should be mentioned which is INFY
#another part is user need to mention the stock type which is
#o for NSE and 1 for NASDAQ

require 'net/http'
require 'json'
require 'rubygems'
require 'active_record'
gem 'mysql2', '>= 0.3.13', '< 0.5'
require 'mysql2'
ActiveRecord::Base.establish_connection(
:adapter => "mysql2",
:host => "127.0.0.1",
:database => "stockxchange2016"
)

class Stock < ActiveRecord::Base
  def stock_value()
    #print "hello"
    #@stock = Stock.find(stock_id)
    $i = 0
    $final = 1
    @stocks = Stock.all()
    head_url_nse = 'http://finance.google.com/finance/info?client=ig&q=NASDAQ:'
    #head_url_nasdaq = 'http://finance.google.com/finance/info?client=ig&q=NASDAQ:'
    url_1 = ""
    #url_2 = ""
    @stocks.each do |stock|
    #while $i < $final do
      #stock = Stock.find(stock_id)
      #puts stock.name
      if stock.stock_type == 1
        url_1 = url_1 + stock.name + ","
      end
      #$i += 1
    end
    url = head_url_nse + url_1
    puts url
    uri = URI(url)
    #return response
    response = Net::HTTP.get(uri)
    #splits the string
    #puts response
    y = response.split("//")[1]
    #puts y
    z = JSON.parse(y)
    #puts z
    #current_stock_price = z[0]["l_fix"]
    #opening_stock_price = z[0]["pcls_fix"]
    #puts current_stock_price
    #puts opening_stock_price
    #starts transaction
    Stock.transaction do
      $i = 0
      $num = z.length()
      #puts $num
      while $i < $num do
        puts z[$i]["l_fix"]
        $j = $i+1
        stock = Stock.find_by_name(z[$i]["t"])
          #name_stock = each_com["t"]
          #stock = Stock.find(name_stock)
        stock.current_price = z[$i]["l_fix"]
        stock.opening_price = z[$i]["pcls_fix"]
        #puts name_stock
        #puts each_com
        $i += 1
        stock.save!
      end
    end
      #@stock.day_high = #stock day high
      #@stock.day_low = #stock day low
  end
end

object = Stock.new

object.stock_value() #unable to call this method
                          #unable to parse into json
