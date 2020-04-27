require "application_system_test_case"

class BrandsCategoriesTest < ApplicationSystemTestCase
  setup do
    @brands_category = brands_categories(:one)
  end

  test "visiting the index" do
    visit brands_categories_url
    assert_selector "h1", text: "Brands Categories"
  end

  test "creating a Brands category" do
    visit brands_categories_url
    click_on "New Brands Category"

    fill_in "Brand id", with: @brands_category.brand_id_id
    fill_in "Category id", with: @brands_category.category_id_id
    click_on "Create Brands category"

    assert_text "Brands category was successfully created"
    click_on "Back"
  end

  test "updating a Brands category" do
    visit brands_categories_url
    click_on "Edit", match: :first

    fill_in "Brand id", with: @brands_category.brand_id_id
    fill_in "Category id", with: @brands_category.category_id_id
    click_on "Update Brands category"

    assert_text "Brands category was successfully updated"
    click_on "Back"
  end

  test "destroying a Brands category" do
    visit brands_categories_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Brands category was successfully destroyed"
  end
end
