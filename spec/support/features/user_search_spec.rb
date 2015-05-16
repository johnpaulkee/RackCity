require 'rails_helper'
require 'support/features'

feature "Registered user can search for events by title" do

  scenario "Registered user is able to search by event title" do

    sample_user_creates_sample_event("Test Event")
    sign_in_with 'tester2@example.com', 'password'
    create_sample_event("Hello World")
    create_sample_event("Hola Chica")
    create_sample_event("Hello World2")
    create_sample_event("Hola Chica2")

    sign_out

    sign_up_with "abrar@abrar.com", "password"
    visit events_path

    fill_in "Search Events", with: "Hello World"
    click_button "Submit"
    expect(page).to have_content("Hello World")
    expect(page).to have_content("Hello World2")
  end

end