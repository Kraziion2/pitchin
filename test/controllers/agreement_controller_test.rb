require 'test_helper'

class AgreementControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get agreement_new_url
    assert_response :success
  end

end
