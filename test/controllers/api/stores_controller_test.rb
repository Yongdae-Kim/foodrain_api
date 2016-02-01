require 'test_helper'

module Api
  class StoresControllerTest < ActionDispatch::IntegrationTest
    setup do
      @store = stores(:one)
    end

    test 'GET #index' do
      get api_stores_url, params: { format: :json }
      assert_response :success
    end

    test 'GET #index (?page=:page)' do
      get api_stores_url, params: { page: '0', format: :json }
      assert_response :success
      assert_equal Store.all.count, 2
    end

    test 'GET #index (?category=:category)' do
      get api_stores_url, params: { category: '1', format: :json }
      assert_response :success
    end
  end
end
