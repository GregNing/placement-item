require "test_helper"

class LineItem::HistoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @line_item_history = line_item_histories(:one)
  end

  test "should get index" do
    get line_item_histories_url
    assert_response :success
  end

  test "should get new" do
    get new_line_item_history_url
    assert_response :success
  end

  test "should create line_item_history" do
    assert_difference("LineItem::History.count") do
      post line_item_histories_url, params: { line_item_history: { actual_amount: @line_item_history.actual_amount, adjustments: @line_item_history.adjustments, booked_amount: @line_item_history.booked_amount, name: @line_item_history.name } }
    end

    assert_redirected_to line_item_history_url(LineItem::History.last)
  end

  test "should show line_item_history" do
    get line_item_history_url(@line_item_history)
    assert_response :success
  end

  test "should get edit" do
    get edit_line_item_history_url(@line_item_history)
    assert_response :success
  end

  test "should update line_item_history" do
    patch line_item_history_url(@line_item_history), params: { line_item_history: { actual_amount: @line_item_history.actual_amount, adjustments: @line_item_history.adjustments, booked_amount: @line_item_history.booked_amount, name: @line_item_history.name } }
    assert_redirected_to line_item_history_url(@line_item_history)
  end

  test "should destroy line_item_history" do
    assert_difference("LineItem::History.count", -1) do
      delete line_item_history_url(@line_item_history)
    end

    assert_redirected_to line_item_histories_url
  end
end
