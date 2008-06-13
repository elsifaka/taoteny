require 'test_helper'

class DefinitionsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:definitions)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_definition
    assert_difference('Definition.count') do
      post :create, :definition => { }
    end

    assert_redirected_to definition_path(assigns(:definition))
  end

  def test_should_show_definition
    get :show, :id => definitions(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => definitions(:one).id
    assert_response :success
  end

  def test_should_update_definition
    put :update, :id => definitions(:one).id, :definition => { }
    assert_redirected_to definition_path(assigns(:definition))
  end

  def test_should_destroy_definition
    assert_difference('Definition.count', -1) do
      delete :destroy, :id => definitions(:one).id
    end

    assert_redirected_to definitions_path
  end
end
