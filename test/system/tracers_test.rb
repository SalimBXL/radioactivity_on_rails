require "application_system_test_case"

class TracersTest < ApplicationSystemTestCase
  setup do
    @tracer = tracers(:one)
  end

  test "visiting the index" do
    visit tracers_url
    assert_selector "h1", text: "Tracers"
  end

  test "creating a Tracer" do
    visit tracers_url
    click_on "New Tracer"

    fill_in "Halflife", with: @tracer.halflife
    fill_in "Molecule", with: @tracer.molecule
    fill_in "Name", with: @tracer.name
    click_on "Create Tracer"

    assert_text "Tracer was successfully created"
    click_on "Back"
  end

  test "updating a Tracer" do
    visit tracers_url
    click_on "Edit", match: :first

    fill_in "Halflife", with: @tracer.halflife
    fill_in "Molecule", with: @tracer.molecule
    fill_in "Name", with: @tracer.name
    click_on "Update Tracer"

    assert_text "Tracer was successfully updated"
    click_on "Back"
  end

  test "destroying a Tracer" do
    visit tracers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Tracer was successfully destroyed"
  end
end
