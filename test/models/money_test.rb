require 'test_helper'

class MoneyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "Test balance method" do
    assert_equal 4.00, Money.balance
  end

  test "Total transaction amount" do
    assert_equal 4, Money.total_transactions
  end

  test "Total amount spend this month" do
    Money.current_monthly_spent
    assert_equal 20.00, Money.current_monthly_spent
  end

  test "Total amount spend previous month" do
    Money.previous_monthly_spent
    assert_equal 0.00, Money.previous_monthly_spent
  end

  test "Total largest amount spent this current month" do
    Money.current_largest_spent_amount
    assert_equal 10.00, Money.current_largest_spent_amount
  end

  test "Total largest id spent this current month" do
    Money.current_largest_spent_amount_id
    assert Money.current_largest_spent_amount_id
  end

  test "Total largest amount spent all time" do
    Money.total_largest_spent_amount
    assert_equal 10.00, Money.total_largest_spent_amount
  end

  test "Total largest spent all time organization" do
    Money.total_largest_spent_amount_org
    assert_equal "Winner", Money.total_largest_spent_amount_org
  end


  # test "Total largest spent overtime at organization" do
  #   Money.overall_most_money_spent
  #   assert_equal "Winner", Money.overall_most_money_spent
  # end



end
