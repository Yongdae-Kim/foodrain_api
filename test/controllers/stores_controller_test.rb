require 'test_helper'

class StoresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @store = stores(:one)
  end

  test 'should get index' do
    get stores_url
    assert_response :success
  end

  test 'should get new' do
    get new_store_url
    assert_response :success
  end

  test 'should create store' do
    assert_difference('Store.count') do
      post stores_url, params: {
        store: {
          address: @store.address,
          category_id: @store.category_id,
          detail: @store.detail,
          end_time: @store.end_time,
          holiday: @store.holiday,
          latitude: @store.latitude,
          longitude: @store.longitude,
          name: @store.name,
          phone: @store.phone,
          start_time: @store.start_time
        }
      }
    end

    assert_redirected_to store_path(Store.last)
  end

  test 'should show store' do
    get store_url(@store)
    assert_response :success
  end

  test 'should get edit' do
    get edit_store_url(@store)
    assert_response :success
  end

  test 'should update store' do
    patch store_url(@store), params: {
      store: {
        address: @store.address,
        category_id: @store.category_id,
        detail: @store.detail,
        end_time: @store.end_time,
        holiday: @store.holiday,
        latitude: @store.latitude,
        longitude: @store.longitude,
        name: @store.name,
        phone: @store.phone,
        start_time: @store.start_time
      }
    }
    assert_redirected_to store_path(@store)
  end

  test 'should destroy store' do
    assert_difference('Store.count', -1) do
      delete store_url(@store)
    end

    assert_redirected_to stores_path
  end
end
