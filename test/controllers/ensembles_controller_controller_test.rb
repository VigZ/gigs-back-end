require 'test_helper'

class EnsemblesControllerControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get ensembles_controller_index_url
    assert_response :success
  end

end
