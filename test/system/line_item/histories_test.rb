require "application_system_test_case"

class LineItem::HistoriesTest < ApplicationSystemTestCase
  setup do
    @line_item_history = line_item_histories(:one)
  end

  test "visiting the index" do
    visit line_item_histories_url
    assert_selector "h1", text: "Histories"
  end

  test "should create history" do
    visit line_item_histories_url
    click_on "New history"

    fill_in "Actual amount", with: @line_item_history.actual_amount
    fill_in "Adjustments", with: @line_item_history.adjustments
    fill_in "Booked amount", with: @line_item_history.booked_amount
    fill_in "Name", with: @line_item_history.name
    click_on "Create History"

    assert_text "History was successfully created"
    click_on "Back"
  end

  test "should update History" do
    visit line_item_history_url(@line_item_history)
    click_on "Edit this history", match: :first

    fill_in "Actual amount", with: @line_item_history.actual_amount
    fill_in "Adjustments", with: @line_item_history.adjustments
    fill_in "Booked amount", with: @line_item_history.booked_amount
    fill_in "Name", with: @line_item_history.name
    click_on "Update History"

    assert_text "History was successfully updated"
    click_on "Back"
  end

  test "should destroy History" do
    visit line_item_history_url(@line_item_history)
    click_on "Destroy this history", match: :first

    assert_text "History was successfully destroyed"
  end
end
