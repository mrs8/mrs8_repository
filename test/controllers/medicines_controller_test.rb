require 'test_helper'

class MedicinesControllerTest < ActionController::TestCase
  setup do
    @medicine = medicines(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:medicines)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create medicine" do
    assert_difference('Medicine.count') do
      post :create, medicine: { category_id: @medicine.category_id, dosage: @medicine.dosage, manufacturer: @medicine.manufacturer, medicine_name: @medicine.medicine_name, need_recipe: @medicine.need_recipe, price: @medicine.price, quantity_or_volume: @medicine.quantity_or_volume }
    end

    assert_redirected_to medicine_path(assigns(:medicine))
  end

  test "should show medicine" do
    get :show, id: @medicine
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @medicine
    assert_response :success
  end

  test "should update medicine" do
    patch :update, id: @medicine, medicine: { category_id: @medicine.category_id, dosage: @medicine.dosage, manufacturer: @medicine.manufacturer, medicine_name: @medicine.medicine_name, need_recipe: @medicine.need_recipe, price: @medicine.price, quantity_or_volume: @medicine.quantity_or_volume }
    assert_redirected_to medicine_path(assigns(:medicine))
  end

  test "should destroy medicine" do
    assert_difference('Medicine.count', -1) do
      delete :destroy, id: @medicine
    end

    assert_redirected_to medicines_path
  end
end
