require 'test_helper'

class MoneyControllerTest < ActionController::TestCase
  setup do
    @money = money(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:money)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create money" do
    assert_difference('Money.count') do
      post :create, money: { amount: @money.amount, date: @money.date, deposit: @money.deposit, organization: @money.organization }
    end

    assert_redirected_to money_path(assigns(:money))
  end

  test "should show money" do
    get :show, id: @money
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @money
    assert_response :success
  end

  test "should update money" do
    patch :update, id: @money, money: { amount: @money.amount, date: @money.date, deposit: @money.deposit, organization: @money.organization }
    assert_redirected_to money_path(assigns(:money))
  end

  test "should destroy money" do
    assert_difference('Money.count', -1) do
      delete :destroy, id: @money
    end

    assert_redirected_to money_index_path
  end

  test "get balance" do
    get :index, id: @money
      assert_equal 4.0, Money.balance
    end

  test "get total transactions amount" do
    get :index, id: @money
    assert_equal 4, Money.total_transactions
  end


    test "get current month total amount spent" do
      get :index, id: @money
      assert_equal 20.00, Money.current_monthly_spent
    end

    test "get previous month total amount spent" do
      get :index, id: @money
      assert_equal 0.00, Money.previous_monthly_spent
    end

    test "get largest transaction this current month" do
      get :index, id: @money
      assert_equal 10.00, Money.current_largest_spent_amount
    end

    test "get largest transaction this current month id" do
      get :index, id: @money
      assert Money.current_largest_spent_amount_id
    end

    test "get largest transaction ever" do
      get :index, id: @money
      assert_equal 10.00, Money.total_largest_spent_amount
    end

    test "get largest transaction ever organization" do
      get :index, id: @money
      assert_equal "Winner", Money.total_largest_spent_amount_org
    end




end
