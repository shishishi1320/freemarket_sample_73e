require "application_system_test_case"

class AddressesTest < ApplicationSystemTestCase
  setup do
    @address = addresses(:one)
  end

  test "visiting the index" do
    visit addresses_url
    assert_selector "h1", text: "Addresses"
  end

  test "creating a Address" do
    visit addresses_url
    click_on "New Address"

    fill_in "Block", with: @address.block
    fill_in "Building", with: @address.building
    fill_in "City", with: @address.city
    fill_in "Phone number", with: @address.phone_number
    fill_in "Postal code", with: @address.postal_code
    fill_in "Prefecture", with: @address.prefecture
    fill_in "Send first name", with: @address.send_first_name
    fill_in "Send first name kana", with: @address.send_first_name_kana
    fill_in "Send name", with: @address.send_name
    fill_in "Send name kana", with: @address.send_name_kana
    fill_in "User id", with: @address.user_id_id
    click_on "Create Address"

    assert_text "Address was successfully created"
    click_on "Back"
  end

  test "updating a Address" do
    visit addresses_url
    click_on "Edit", match: :first

    fill_in "Block", with: @address.block
    fill_in "Building", with: @address.building
    fill_in "City", with: @address.city
    fill_in "Phone number", with: @address.phone_number
    fill_in "Postal code", with: @address.postal_code
    fill_in "Prefecture", with: @address.prefecture
    fill_in "Send first name", with: @address.send_first_name
    fill_in "Send first name kana", with: @address.send_first_name_kana
    fill_in "Send name", with: @address.send_name
    fill_in "Send name kana", with: @address.send_name_kana
    fill_in "User id", with: @address.user_id_id
    click_on "Update Address"

    assert_text "Address was successfully updated"
    click_on "Back"
  end

  test "destroying a Address" do
    visit addresses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Address was successfully destroyed"
  end
end
