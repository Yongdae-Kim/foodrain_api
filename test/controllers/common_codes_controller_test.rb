require 'test_helper'

class CommonCodesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @common_code = common_codes(:one)
  end

  test 'should get index' do
    get common_codes_url
    assert_response :success
  end

  test 'should get new' do
    get new_common_code_url
    assert_response :success
  end

  test 'should create common_code' do
    assert_difference('CommonCode.count') do
      post common_codes_url, params: {
        common_code: {
          detail_code_id: @common_code.detail_code_id,
          main_code: @common_code.main_code,
          name_kor: @common_code.name_kor
        }
      }
    end

    assert_redirected_to common_code_path(CommonCode.last)
  end

  test 'should show common_code' do
    get common_code_url(@common_code)
    assert_response :success
  end

  test 'should get edit' do
    get edit_common_code_url(@common_code)
    assert_response :success
  end

  test 'should update common_code' do
    patch common_code_url(@common_code), params: {
      common_code: {
        detail_code_id: @common_code.detail_code_id,
        main_code: @common_code.main_code,
        name_kor: @common_code.name_kor
      }
    }
    assert_redirected_to common_code_path(@common_code)
  end

  test 'should destroy common_code' do
    assert_difference('CommonCode.count', -1) do
      delete common_code_url(@common_code)
    end

    assert_redirected_to common_codes_path
  end
end
