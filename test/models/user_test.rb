require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "create_user" do
    u = User.create(name: "user", email: "user@example.com", password: 'thanks123')
    assert !u.save, "User created without college id. Every user should have a college id"

    # Now adding college to user. Now you should be able to save user.
    college = College.find_by_name("college1")
    u.college_id = college.id
    assert u.save, "User creation failed"
    assert u.name=="user", "Incorrect Name"
    assert u.email=="user@example.com", "Incorrect email"
  end


  test "buy_stock" do
    u = User.first
    stock = Stock.first
    initialBalance = u.balance;
    sold_count = stock.sold_count
    #puts u.buy(stock.id, 10)
    assert u.buy(stock.id, 10)==true, "Buy Failed"
    assert u.balance== initialBalance - 10 * stock.current_price, "Incorrect Amount deducted"
    stock.reload
    assert stock.sold_count==sold_count+1, "Sold count of stock not incremented"
    #assert u.balance==(initialBalance-100*stock.current_price), "Amount not deducted correctly"
  end
end
