require 'test_helper'

module Api
  class StoresControllerTest < ActionDispatch::IntegrationTest
    test 'GET #index' do
      get api_stores_url, params: { format: :json }
      assert_response :success
    end
  end
end
