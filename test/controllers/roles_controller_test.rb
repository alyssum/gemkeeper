require 'test_helper'

class RolesControllerTest < ActionController::TestCase
  setup do
    @role = roles(:one)
    sign_in users(:one)
  end

  test "should get new" do
    get :new, game_id: @role.game_id
    assert_response :success
  end

  test "should create role" do
    assert_difference('Role.count') do
      post :create, game_id: @role.game_id, role: { game_id: @role.game_id, name: @role.name }
    end

    assert_redirected_to game_path(:id => @role.game_id)
  end

  test "should get edit" do
    get :edit, id: @role
    assert_response :success
  end

  test "should update role" do
    patch :update, id: @role, role: { game_id: @role.game_id, name: @role.name }
    assert_redirected_to game_path(:id => @role.game_id)
  end

  test "should destroy role" do
    assert_difference('Role.count', -1) do
      delete :destroy, id: @role
    end

    assert_redirected_to game_path(:id => @role.game_id)
  end
end
