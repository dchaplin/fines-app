require 'test_helper'

class FinesControllerTest < ActionController::TestCase
  setup do
    @fine = fines(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fines)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fine" do
    assert_difference('Fine.count') do
      post :create, fine: { amount: @fine.amount, date: @fine.date, description: @fine.description, offender_id: @fine.offender_id, proposed_by_id: @fine.proposed_by_id, status: @fine.status }
    end

    assert_redirected_to fine_path(assigns(:fine))
  end

  test "should show fine" do
    get :show, id: @fine
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fine
    assert_response :success
  end

  test "should update fine" do
    patch :update, id: @fine, fine: { amount: @fine.amount, date: @fine.date, description: @fine.description, offender_id: @fine.offender_id, proposed_by_id: @fine.proposed_by_id, status: @fine.status }
    assert_redirected_to fine_path(assigns(:fine))
  end

  test "should destroy fine" do
    assert_difference('Fine.count', -1) do
      delete :destroy, id: @fine
    end

    assert_redirected_to fines_path
  end
end
