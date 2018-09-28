require "application_system_test_case"

class RateableAttributesTest < ApplicationSystemTestCase
  setup do
    @rateable_attribute = rateable_attributes(:one)
  end

  test "visiting the index" do
    visit rateable_attributes_url
    assert_selector "h1", text: "Rateable Attributes"
  end

  test "creating a Rateable attribute" do
    visit rateable_attributes_url
    click_on "New Rateable Attribute"

    click_on "Create Rateable attribute"

    assert_text "Rateable attribute was successfully created"
    click_on "Back"
  end

  test "updating a Rateable attribute" do
    visit rateable_attributes_url
    click_on "Edit", match: :first

    click_on "Update Rateable attribute"

    assert_text "Rateable attribute was successfully updated"
    click_on "Back"
  end

  test "destroying a Rateable attribute" do
    visit rateable_attributes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Rateable attribute was successfully destroyed"
  end
end
