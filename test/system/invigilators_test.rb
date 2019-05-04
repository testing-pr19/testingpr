require "application_system_test_case"

class InvigilatorsTest < ApplicationSystemTestCase
  setup do
    @invigilator = invigilators(:one)
  end

  test "visiting the index" do
    visit invigilators_url
    assert_selector "h1", text: "Invigilators"
  end

  test "creating a Invigilator" do
    visit invigilators_url
    click_on "New Invigilator"

    fill_in "Name", with: @invigilator.name
    click_on "Create Invigilator"

    assert_text "Invigilator was successfully created"
    click_on "Back"
  end

  test "updating a Invigilator" do
    visit invigilators_url
    click_on "Edit", match: :first

    fill_in "Name", with: @invigilator.name
    click_on "Update Invigilator"

    assert_text "Invigilator was successfully updated"
    click_on "Back"
  end

  test "destroying a Invigilator" do
    visit invigilators_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Invigilator was successfully destroyed"
  end
end
