require 'test_helper'

class StoreMenusControllerTest < ActionDispatch::IntegrationTest
  setup do
    @store_menu = store_menus(:one)
  end

  test 'should get index' do
    get store_menus_url
    assert_response :success
  end

  test 'should get new' do
    get new_store_menu_url
    assert_response :success
  end

  test 'should create store_menu' do
    assert_difference('StoreMenu.count') do
      post store_menus_url, params: {
        store_menu: {
          store_id: @store_menu.store_id
        }
      }
    end

    assert_redirected_to store_menu_path(StoreMenu.last)
  end

  test 'should show store_menu' do
    get store_menu_url(@store_menu)
    assert_response :success
  end

  test 'should get edit' do
    get edit_store_menu_url(@store_menu)
    assert_response :success
  end

  test 'should update store_menu' do
    patch store_menu_url(@store_menu), params: {
      store_menu: {
        store_id: @store_menu.store_id
      }
    }
    assert_redirected_to store_menu_path(@store_menu)
  end

  test 'should destroy store_menu' do
    assert_difference('StoreMenu.count', -1) do
      delete store_menu_url(@store_menu)
    end

    assert_redirected_to store_menus_path
  end
end
