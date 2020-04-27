require 'test_helper'

class ItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @item = items(:one)
  end

  test "should get index" do
    get items_url
    assert_response :success
  end

  test "should get new" do
    get new_item_url
    assert_response :success
  end

  test "should create item" do
    assert_difference('Item.count') do
      post items_url, params: { item: { brand_id_id: @item.brand_id_id, buyer_id: @item.buyer_id, category_id_id: @item.category_id_id, condition: @item.condition, delivery_area: @item.delivery_area, delivery_date: @item.delivery_date, delivery_method: @item.delivery_method, name: @item.name, price: @item.price, seller_id: @item.seller_id, shipping_cost: @item.shipping_cost, size: @item.size, status: @item.status, text: @item.text } }
    end

    assert_redirected_to item_url(Item.last)
  end

  test "should show item" do
    get item_url(@item)
    assert_response :success
  end

  test "should get edit" do
    get edit_item_url(@item)
    assert_response :success
  end

  test "should update item" do
    patch item_url(@item), params: { item: { brand_id_id: @item.brand_id_id, buyer_id: @item.buyer_id, category_id_id: @item.category_id_id, condition: @item.condition, delivery_area: @item.delivery_area, delivery_date: @item.delivery_date, delivery_method: @item.delivery_method, name: @item.name, price: @item.price, seller_id: @item.seller_id, shipping_cost: @item.shipping_cost, size: @item.size, status: @item.status, text: @item.text } }
    assert_redirected_to item_url(@item)
  end

  test "should destroy item" do
    assert_difference('Item.count', -1) do
      delete item_url(@item)
    end

    assert_redirected_to items_url
  end
end
