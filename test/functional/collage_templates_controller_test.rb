require 'test_helper'

class CollageTemplatesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:collage_templates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create collage_template" do
    assert_difference('CollageTemplate.count') do
      post :create, :collage_template => { }
    end

    assert_redirected_to collage_template_path(assigns(:collage_template))
  end

  test "should show collage_template" do
    get :show, :id => collage_templates(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => collage_templates(:one).to_param
    assert_response :success
  end

  test "should update collage_template" do
    put :update, :id => collage_templates(:one).to_param, :collage_template => { }
    assert_redirected_to collage_template_path(assigns(:collage_template))
  end

  test "should destroy collage_template" do
    assert_difference('CollageTemplate.count', -1) do
      delete :destroy, :id => collage_templates(:one).to_param
    end

    assert_redirected_to collage_templates_path
  end
end
