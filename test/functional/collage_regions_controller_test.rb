require 'test_helper'

class CollageRegionsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:collage_regions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create collage_region" do
    assert_difference('CollageRegion.count') do
      post :create, :collage_region => { }
    end

    assert_redirected_to collage_region_path(assigns(:collage_region))
  end

  test "should show collage_region" do
    get :show, :id => collage_regions(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => collage_regions(:one).to_param
    assert_response :success
  end

  test "should update collage_region" do
    put :update, :id => collage_regions(:one).to_param, :collage_region => { }
    assert_redirected_to collage_region_path(assigns(:collage_region))
  end

  test "should destroy collage_region" do
    assert_difference('CollageRegion.count', -1) do
      delete :destroy, :id => collage_regions(:one).to_param
    end

    assert_redirected_to collage_regions_path
  end
end
