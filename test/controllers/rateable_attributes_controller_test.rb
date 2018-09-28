require 'test_helper'

class RateableAttributesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rateable_attribute = rateable_attributes(:one)
  end

  test "should get index" do
    get rateable_attributes_url
    assert_response :success
  end

  test "should get new" do
    get new_rateable_attribute_url
    assert_response :success
  end

  test "should create rateable_attribute" do
    assert_difference('RateableAttribute.count') do
      post rateable_attributes_url, params: { rateable_attribute: {  } }
    end

    assert_redirected_to rateable_attribute_url(RateableAttribute.last)
  end

  test "should show rateable_attribute" do
    get rateable_attribute_url(@rateable_attribute)
    assert_response :success
  end

  test "should get edit" do
    get edit_rateable_attribute_url(@rateable_attribute)
    assert_response :success
  end

  test "should update rateable_attribute" do
    patch rateable_attribute_url(@rateable_attribute), params: { rateable_attribute: {  } }
    assert_redirected_to rateable_attribute_url(@rateable_attribute)
  end

  test "should destroy rateable_attribute" do
    assert_difference('RateableAttribute.count', -1) do
      delete rateable_attribute_url(@rateable_attribute)
    end

    assert_redirected_to rateable_attributes_url
  end
end
