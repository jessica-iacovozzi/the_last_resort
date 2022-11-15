require "test_helper"

class SpellsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get spells_index_url
    assert_response :success
  end

  test "should get new" do
    get spells_new_url
    assert_response :success
  end

  test "should get create" do
    get spells_create_url
    assert_response :success
  end
end
