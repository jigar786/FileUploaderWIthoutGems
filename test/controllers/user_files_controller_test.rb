require 'test_helper'

class UserFilesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get user_files_create_url
    assert_response :success
  end

  test "should get destroy" do
    get user_files_destroy_url
    assert_response :success
  end

end
