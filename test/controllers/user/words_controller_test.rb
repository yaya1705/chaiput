require "test_helper"

class User::WordsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_words_index_url
    assert_response :success
  end

  test "should get show" do
    get user_words_show_url
    assert_response :success
  end
end
