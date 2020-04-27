require "application_system_test_case"

class ItemsTest < ApplicationSystemTestCase
  setup do
    @item = items(:one)
  end

  test "visiting the index" do
    visit items_url
    assert_selector "h1", text: "Items"
  end

  test "creating a Item" do
    visit items_url
    click_on "New Item"

    fill_in "Brand id", with: @item.brand_id_id
    fill_in "Buyer", with: @item.buyer_id
    fill_in "Category id", with: @item.category_id_id
    fill_in "Condition", with: @item.condition
    fill_in "Delivery area", with: @item.delivery_area
    fill_in "Delivery date", with: @item.delivery_date
    fill_in "Delivery method", with: @item.delivery_method
    fill_in "Name", with: @item.name
    fill_in "Price", with: @item.price
    fill_in "Seller", with: @item.seller_id
    fill_in "Shipping cost", with: @item.shipping_cost
    fill_in "Size", with: @item.size
    fill_in "Status", with: @item.status
    fill_in "Text", with: @item.text
    click_on "Create Item"

    assert_text "Item was successfully created"
    click_on "Back"
  end

  test "updating a Item" do
    visit items_url
    click_on "Edit", match: :first

    fill_in "Brand id", with: @item.brand_id_id
    fill_in "Buyer", with: @item.buyer_id
    fill_in "Category id", with: @item.category_id_id
    fill_in "Condition", with: @item.condition
    fill_in "Delivery area", with: @item.delivery_area
    fill_in "Delivery date", with: @item.delivery_date
    fill_in "Delivery method", with: @item.delivery_method
    fill_in "Name", with: @item.name
    fill_in "Price", with: @item.price
    fill_in "Seller", with: @item.seller_id
    fill_in "Shipping cost", with: @item.shipping_cost
    fill_in "Size", with: @item.size
    fill_in "Status", with: @item.status
    fill_in "Text", with: @item.text
    click_on "Update Item"

    assert_text "Item was successfully updated"
    click_on "Back"
  end

  test "destroying a Item" do
    visit items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Item was successfully destroyed"
  end
end
