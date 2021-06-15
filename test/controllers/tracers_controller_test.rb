require "test_helper"

class TracersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tracer = tracers(:one)
  end

  test "should get index" do
    get tracers_url
    assert_response :success
  end

  test "should get new" do
    get new_tracer_url
    assert_response :success
  end

  test "should create tracer" do
    assert_difference('Tracer.count') do
      post tracers_url, params: { tracer: { halflife: @tracer.halflife, molecule: @tracer.molecule, name: @tracer.name } }
    end

    assert_redirected_to tracer_url(Tracer.last)
  end

  test "should show tracer" do
    get tracer_url(@tracer)
    assert_response :success
  end

  test "should get edit" do
    get edit_tracer_url(@tracer)
    assert_response :success
  end

  test "should update tracer" do
    patch tracer_url(@tracer), params: { tracer: { halflife: @tracer.halflife, molecule: @tracer.molecule, name: @tracer.name } }
    assert_redirected_to tracer_url(@tracer)
  end

  test "should destroy tracer" do
    assert_difference('Tracer.count', -1) do
      delete tracer_url(@tracer)
    end

    assert_redirected_to tracers_url
  end
end
