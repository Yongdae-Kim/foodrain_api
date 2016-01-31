require 'test_helper'

module Api
  class CategoriesControllerTest < ActionDispatch::IntegrationTest
    test 'GET #index' do
      get api_categories_url, params: { format: :json }
      assert_response :success
    end
  end
end
