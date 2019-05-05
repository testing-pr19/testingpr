require "application_system_test_case"

class UploadedFilesTest < ApplicationSystemTestCase
  setup do
    @uploaded_file = uploaded_files(:one)
  end

  test "visiting the index" do
    visit uploaded_files_url
    assert_selector "h1", text: "Uploaded Files"
  end

  test "creating a Uploaded file" do
    visit uploaded_files_url
    click_on "New Uploaded File"

    fill_in "File name", with: @uploaded_file.file_name
    click_on "Create Uploaded file"

    assert_text "Uploaded file was successfully created"
    click_on "Back"
  end

  test "updating a Uploaded file" do
    visit uploaded_files_url
    click_on "Edit", match: :first

    fill_in "File name", with: @uploaded_file.file_name
    click_on "Update Uploaded file"

    assert_text "Uploaded file was successfully updated"
    click_on "Back"
  end

  test "destroying a Uploaded file" do
    visit uploaded_files_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Uploaded file was successfully destroyed"
  end
end
