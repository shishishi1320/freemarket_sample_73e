require 'test_helper'

class BrandsCategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @brands_category = brands_categories(:one)
  end

  test "should get index" do
    get brands_categories_url
    assert_response :success
  end

  test "should get new" do
    get new_brands_category_url
    assert_response :success
  end

  test "should create brands_category" do
    assert_difference('BrandsCategory.count') do
      post brands_categories_url, params: { brands_category: { brand_id_id: @brands_category.brand_id_id, category_id_id: @brands_category.category_id_id } }
    end

    assert_redirected_to brands_category_url(BrandsCategory.last)
  end

  test "should show brands_category" do
    get brands_category_url(@brands_category)
    assert_response :success
  end

  test "should get edit" do
    get edit_brands_category_url(@brands_category)
    assert_response :success
  end

  test "should update brands_category" do
    patch brands_category_url(@brands_category), params: { brands_category: { brand_id_id: @brands_category.brand_id_id, category_id_id: @brands_category.category_id_id } }
    assert_redirected_to brands_category_url(@brands_category)
  end

  test "should destroy brands_category" do
    assert_difference('BrandsCategory.count', -1) do
      delete brands_category_url(@brands_category)
    end

    assert_redirected_to brands_categories_url
  end
end
