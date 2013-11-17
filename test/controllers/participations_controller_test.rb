require 'test_helper'

class ParticipationsControllerTest < ActionController::TestCase
  setup do
    @participation = participations(:one)
    sign_in users(:one)
  end

  test "should get new" do
    get :new, game_session_id: @participation.session_id
    assert_response :success
  end

  test "should create participation" do
    assert_difference('Participation.count') do
      post :create, game_session_id: @participation.session_id, participation: { player_id: @participation.player_id, role_id: @participation.role_id, score: @participation.score, session_id: @participation.session_id }
    end

    assert_redirected_to game_session_path(:id => @participation.session_id)
  end

  test "should get edit" do
    get :edit, id: @participation
    assert_response :success
  end

  test "should update participation" do
    patch :update, id: @participation, participation: { player_id: @participation.player_id, role_id: @participation.role_id, score: @participation.score, session_id: @participation.session_id }
    assert_redirected_to game_session_path(:id => @participation.session_id)
  end

  test "should destroy participation" do
    assert_difference('Participation.count', -1) do
      delete :destroy, id: @participation
    end

    assert_redirected_to game_session_path(:id => @participation.session_id)
  end
end
