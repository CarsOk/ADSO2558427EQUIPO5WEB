require "test_helper"

class ReservasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get reservas_index_url
    assert_response :success
  end

  test "should get new" do
    get reservas_new_url
    assert_response :success
  end

  test "should get show" do
    get reservas_show_url
    assert_response :success
  end

  test "should get edit" do
    get reservas_edit_url
    assert_response :success
  end
end
