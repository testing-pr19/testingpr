require "application_system_test_case"

class FileDataTest < ApplicationSystemTestCase
  setup do
    @file_datum = file_data(:one)
  end

  test "visiting the index" do
    visit file_data_url
    assert_selector "h1", text: "File Data"
  end

  test "creating a File datum" do
    visit file_data_url
    click_on "New File Datum"

    fill_in "Timing", with: @file_datum.timing
    click_on "Create File datum"

    assert_text "File datum was successfully created"
    click_on "Back"
  end

  test "updating a File datum" do
    visit file_data_url
    click_on "Edit", match: :first

    fill_in "Timing", with: @file_datum.timing
    click_on "Update File datum"

    assert_text "File datum was successfully updated"
    click_on "Back"
  end

  test "destroying a File datum" do
    visit file_data_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "File datum was successfully destroyed"
  end
end
