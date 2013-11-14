require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  setup do
    @session = sessions(:one)
    sign_in users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sessions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create session" do
    assert_difference('Session.count') do
      post :create, session: { comments: @session.comments, is_stalemate: @session.is_stalemate, date: @session.date, game_id: @session.game_id }
    end

    assert_redirected_to game_session_path(assigns(:session))
  end

  test "should show session" do
    get :show, id: @session
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @session
    assert_response :success
  end

  test "should update session" do
    patch :update, id: @session, session: { comments: @session.comments, is_stalemate: @session.is_stalemate, date: @session.date, game_id: @session.game_id }
    assert_redirected_to game_session_path(assigns(:session))
  end

  test "should destroy session" do
    assert_difference('Session.count', -1) do
      delete :destroy, id: @session
    end

    assert_redirected_to game_sessions_path
  end
end
