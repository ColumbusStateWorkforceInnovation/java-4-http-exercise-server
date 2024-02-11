require "application_system_test_case"

class OrderLineItemsTest < ApplicationSystemTestCase
  setup do
    @order_line_item = order_line_items(:one)
  end

  test "visiting the index" do
    visit order_line_items_url
    assert_selector "h1", text: "Order line items"
  end

  test "should create order line item" do
    visit order_line_items_url
    click_on "New order line item"

    fill_in "Count", with: @order_line_item.count
    fill_in "Order", with: @order_line_item.order_id
    fill_in "Product", with: @order_line_item.product_id
    click_on "Create Order line item"

    assert_text "Order line item was successfully created"
    click_on "Back"
  end

  test "should update Order line item" do
    visit order_line_item_url(@order_line_item)
    click_on "Edit this order line item", match: :first

    fill_in "Count", with: @order_line_item.count
    fill_in "Order", with: @order_line_item.order_id
    fill_in "Product", with: @order_line_item.product_id
    click_on "Update Order line item"

    assert_text "Order line item was successfully updated"
    click_on "Back"
  end

  test "should destroy Order line item" do
    visit order_line_item_url(@order_line_item)
    click_on "Destroy this order line item", match: :first

    assert_text "Order line item was successfully destroyed"
  end
end
