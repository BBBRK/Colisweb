require 'test_helper'

class TransportersControllerTest < ActionController::TestCase
  setup do
    @transporter = transporters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:transporters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create transporter" do
    assert_difference('Transporter.count') do
      post :create, transporter: { name: @transporter.name }
    end

    assert_redirected_to transporter_path(assigns(:transporter))
  end

  test "should show transporter" do
    get :show, id: @transporter
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @transporter
    assert_response :success
  end

  test "should update transporter" do
    patch :update, id: @transporter, transporter: { name: @transporter.name }
    assert_redirected_to transporter_path(assigns(:transporter))
  end

  test "should destroy transporter" do
    assert_difference('Transporter.count', -1) do
      delete :destroy, id: @transporter
    end

    assert_redirected_to transporters_path
  end
end
