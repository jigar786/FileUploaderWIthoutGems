require 'test_helper'

class SharedFilesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get shared_files_create_url
    assert_response :success
  end

  test "should get show" do
    get shared_files_show_url
    assert_response :success
  end

end
