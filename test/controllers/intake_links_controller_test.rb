require "test_helper"

class IntakeLinksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get intake_links_index_url
    assert_response :success
  end

  test "should get create" do
    get intake_links_create_url
    assert_response :success
  end
end
