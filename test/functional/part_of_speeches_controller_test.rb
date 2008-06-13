require 'test_helper'

class PartOfSpeechesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:part_of_speeches)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_part_of_speech
    assert_difference('PartOfSpeech.count') do
      post :create, :part_of_speech => { }
    end

    assert_redirected_to part_of_speech_path(assigns(:part_of_speech))
  end

  def test_should_show_part_of_speech
    get :show, :id => part_of_speeches(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => part_of_speeches(:one).id
    assert_response :success
  end

  def test_should_update_part_of_speech
    put :update, :id => part_of_speeches(:one).id, :part_of_speech => { }
    assert_redirected_to part_of_speech_path(assigns(:part_of_speech))
  end

  def test_should_destroy_part_of_speech
    assert_difference('PartOfSpeech.count', -1) do
      delete :destroy, :id => part_of_speeches(:one).id
    end

    assert_redirected_to part_of_speeches_path
  end
end
