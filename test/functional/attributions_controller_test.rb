require 'test_helper'

class AttributionsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:attributions)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_attribution
    assert_difference('Attribution.count') do
      post :create, :attribution => { }
    end

    assert_redirected_to attribution_path(assigns(:attribution))
  end

  def test_should_show_attribution
    get :show, :id => attributions(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => attributions(:one).id
    assert_response :success
  end

  def test_should_update_attribution
    put :update, :id => attributions(:one).id, :attribution => { }
    assert_redirected_to attribution_path(assigns(:attribution))
  end

  def test_should_destroy_attribution
    assert_difference('Attribution.count', -1) do
      delete :destroy, :id => attributions(:one).id
    end

    assert_redirected_to attributions_path
  end
end
