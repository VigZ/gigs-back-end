require 'test_helper'

class IntrumentsControllerControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get intruments_controller_index_url
    assert_response :success
  end

end
