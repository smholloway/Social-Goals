require 'test_helper'

class AchievementTypesControllerTest < ActionController::TestCase
  setup do
    @achievement_type = achievement_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:achievement_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create achievement_type" do
    assert_difference('AchievementType.count') do
      post :create, :achievement_type => @achievement_type.attributes
    end

    assert_redirected_to achievement_type_path(assigns(:achievement_type))
  end

  test "should show achievement_type" do
    get :show, :id => @achievement_type.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @achievement_type.to_param
    assert_response :success
  end

  test "should update achievement_type" do
    put :update, :id => @achievement_type.to_param, :achievement_type => @achievement_type.attributes
    assert_redirected_to achievement_type_path(assigns(:achievement_type))
  end

  test "should destroy achievement_type" do
    assert_difference('AchievementType.count', -1) do
      delete :destroy, :id => @achievement_type.to_param
    end

    assert_redirected_to achievement_types_path
  end
end
