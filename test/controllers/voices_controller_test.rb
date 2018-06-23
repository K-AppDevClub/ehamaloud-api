require 'test_helper'

class VoicesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @voice = voices(:one)
  end

  test "should get index" do
    get voices_url, as: :json
    assert_response :success
  end

  test "should create voice" do
    assert_difference('Voice.count') do
      post voices_url, params: { voice: { data: @voice.data, score_id: @voice.score_id } }, as: :json
    end

    assert_response 201
  end

  test "should show voice" do
    get voice_url(@voice), as: :json
    assert_response :success
  end

  test "should update voice" do
    patch voice_url(@voice), params: { voice: { data: @voice.data, score_id: @voice.score_id } }, as: :json
    assert_response 200
  end

  test "should destroy voice" do
    assert_difference('Voice.count', -1) do
      delete voice_url(@voice), as: :json
    end

    assert_response 204
  end
end
