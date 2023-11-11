require "test_helper"

class CalendariosControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get calendarios_show_url
    assert_response :success
  end
end
