require "test_helper"

class LineItem::HistoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @line_item = line_items(:one)
  end

  test 'should get index' do
    get line_item_histories_url(@line_item)
    assert_response :success
  end
end
