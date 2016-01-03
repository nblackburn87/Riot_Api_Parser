require 'test_helper'

class SummonersControllerTest < ActionController::TestCase
  setup do
    @summoner = summoners(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should create summoner" do
    assert_difference('Summoner.count') do
      post :create, params: { summoner: { name: @summoner.name, profileIconId: @summoner.profileIconId, revisionDate: @summoner.revisionDate, summonerLevel: @summoner.summonerLevel } }
    end

    assert_response 201
  end

  test "should show summoner" do
    get :show, params: { id: @summoner }
    assert_response :success
  end

  test "should update summoner" do
    patch :update, params: { id: @summoner, summoner: { name: @summoner.name, profileIconId: @summoner.profileIconId, revisionDate: @summoner.revisionDate, summonerLevel: @summoner.summonerLevel } }
    assert_response 200
  end

  test "should destroy summoner" do
    assert_difference('Summoner.count', -1) do
      delete :destroy, params: { id: @summoner }
    end

    assert_response 204
  end
end
