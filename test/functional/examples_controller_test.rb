require 'test_helper'

class ExamplesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:examples)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_example
    assert_difference('Example.count') do
      post :create, :example => { }
    end

    assert_redirected_to example_path(assigns(:example))
  end

  def test_should_show_example
    get :show, :id => examples(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => examples(:one).id
    assert_response :success
  end

  def test_should_update_example
    put :update, :id => examples(:one).id, :example => { }
    assert_redirected_to example_path(assigns(:example))
  end

  def test_should_destroy_example
    assert_difference('Example.count', -1) do
      delete :destroy, :id => examples(:one).id
    end

    assert_redirected_to examples_path
  end
end
