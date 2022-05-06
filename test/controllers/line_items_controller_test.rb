require "test_helper"

class LineItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @line_item = line_items(:one)
    @campaign = campaigns(:one)
  end

  test 'should get new' do
    get new_campaign_line_item_url(campaign_id: @campaign.id)
    assert_response :success
  end

  test 'should create line_item' do
    assert_difference('LineItem.count') do
      post "/campaigns/#{@campaign.id}/line_items", params: { line_item: { actual_amount: @line_item.actual_amount, adjustments: @line_item.adjustments, booked_amount: @line_item.booked_amount, name: @line_item.name } }
    end

    assert_redirected_to campaign_line_item_url(campaign_id: @campaign.id, id: LineItem.last)
  end

  test 'should show line_item' do
    get campaign_line_item_url(campaign_id: @campaign.id, id: @line_item.id)
    assert_response :success
  end

  test 'should get edit' do
    get edit_campaign_line_item_url(campaign_id: @campaign.id, id: @line_item.id)
    assert_response :success
  end

  test 'should update line_item' do
    patch campaign_line_item_url(campaign_id: @campaign.id, id: @line_item.id), params: { line_item: { actual_amount: @line_item.actual_amount, adjustments: @line_item.adjustments, booked_amount: @line_item.booked_amount, name: @line_item.name } }
    assert_redirected_to campaign_line_item_url(campaign_id: @campaign.id, id: @line_item.id)
  end

  test 'should destroy line_item' do
    assert_difference('LineItem.count', -1) do
      delete campaign_line_item_url(campaign_id: @line_item.campaign.id, id: @line_item.id)
    end

    assert_redirected_to campaign_url(@line_item.campaign)
  end
end
