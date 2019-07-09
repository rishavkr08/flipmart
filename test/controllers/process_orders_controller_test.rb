require 'test_helper'

class ProcessOrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get process_orders_index_url
    assert_response :success
  end

end
