require 'test_helper'

class AvaInfosControllerTest < ActionController::TestCase
  setup do
    @ava_info = ava_infos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ava_infos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ava_info" do
    assert_difference('AvaInfo.count') do
      post :create, ava_info: { medicine_id: @ava_info.medicine_id, pharmacy_id: @ava_info.pharmacy_id, quantity: @ava_info.quantity }
    end

    assert_redirected_to ava_info_path(assigns(:ava_info))
  end

  test "should show ava_info" do
    get :show, id: @ava_info
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ava_info
    assert_response :success
  end

  test "should update ava_info" do
    patch :update, id: @ava_info, ava_info: { medicine_id: @ava_info.medicine_id, pharmacy_id: @ava_info.pharmacy_id, quantity: @ava_info.quantity }
    assert_redirected_to ava_info_path(assigns(:ava_info))
  end

  test "should destroy ava_info" do
    assert_difference('AvaInfo.count', -1) do
      delete :destroy, id: @ava_info
    end

    assert_redirected_to ava_infos_path
  end
end
