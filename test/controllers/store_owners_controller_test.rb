require 'test_helper'

class StoreOwnersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @store_owner = store_owners(:one)
  end

  test 'should get index' do
    get store_owners_url
    assert_response :success
  end

  test 'should get new' do
    get new_store_owner_url
    assert_response :success
  end

  test 'should create store_owner' do
    assert_difference('StoreOwner.count') do
      post store_owners_url, params: {
        store_owner: {
          email: @store_owner.email,
          name: @store_owner.name,
          password: @store_owner.password,
          phone: @store_owner.phone
        }
      }
    end

    assert_redirected_to store_owner_path(StoreOwner.last)
  end

  test 'should show store_owner' do
    get store_owner_url(@store_owner)
    assert_response :success
  end

  test 'should get edit' do
    get edit_store_owner_url(@store_owner)
    assert_response :success
  end

  test 'should update store_owner' do
    patch store_owner_url(@store_owner), params: {
      store_owner: {
        email: @store_owner.email,
        name: @store_owner.name,
        password: @store_owner.password,
        phone: @store_owner.phone
      }
    }
    assert_redirected_to store_owner_path(@store_owner)
  end

  test 'should destroy store_owner' do
    assert_difference('StoreOwner.count', -1) do
      delete store_owner_url(@store_owner)
    end

    assert_redirected_to store_owners_path
  end
end
