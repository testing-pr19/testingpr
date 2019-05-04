require 'test_helper'

class InvigilatorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @invigilator = invigilators(:one)
  end

  test "should get index" do
    get invigilators_url
    assert_response :success
  end

  test "should get new" do
    get new_invigilator_url
    assert_response :success
  end

  test "should create invigilator" do
    assert_difference('Invigilator.count') do
      post invigilators_url, params: { invigilator: { name: @invigilator.name } }
    end

    assert_redirected_to invigilator_url(Invigilator.last)
  end

  test "should show invigilator" do
    get invigilator_url(@invigilator)
    assert_response :success
  end

  test "should get edit" do
    get edit_invigilator_url(@invigilator)
    assert_response :success
  end

  test "should update invigilator" do
    patch invigilator_url(@invigilator), params: { invigilator: { name: @invigilator.name } }
    assert_redirected_to invigilator_url(@invigilator)
  end

  test "should destroy invigilator" do
    assert_difference('Invigilator.count', -1) do
      delete invigilator_url(@invigilator)
    end

    assert_redirected_to invigilators_url
  end
end
