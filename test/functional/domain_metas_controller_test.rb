require File.dirname(__FILE__) + '/../test_helper'

class DomainMetasControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:domain_metas)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_domain_meta
    assert_difference('DomainMeta.count') do
      post :create, :domain_meta => { }
    end

    assert_redirected_to domain_meta_path(assigns(:domain_meta))
  end

  def test_should_show_domain_meta
    get :show, :id => domain_metas(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => domain_metas(:one).id
    assert_response :success
  end

  def test_should_update_domain_meta
    put :update, :id => domain_metas(:one).id, :domain_meta => { }
    assert_redirected_to domain_meta_path(assigns(:domain_meta))
  end

  def test_should_destroy_domain_meta
    assert_difference('DomainMeta.count', -1) do
      delete :destroy, :id => domain_metas(:one).id
    end

    assert_redirected_to domain_metas_path
  end
end
