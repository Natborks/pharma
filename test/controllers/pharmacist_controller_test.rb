require 'test_helper'

class PharmacistControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get pharmacist_new_url
    assert_response :success
  end

end
