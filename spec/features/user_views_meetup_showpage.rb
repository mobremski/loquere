require "rails_helper"

feature "User navigates to meetup show page" do
  let!(:user) { FactpryGirl.create(:user) }
  let!(:meetup) { FactoryGirl.create(:meetup) }

  scenario "signed-in user clicks on meetup's link and visits show page" do
    sign_in

    expect(page).to have_content(meetup.name)
    click_link(meetup.name)

    expect(page).to have_content(meetup.description)
  end

  scenario "unauthenticated user views log in page" do
    visit meetups_path

    expect(page).to have_content(meetup.name)
    click_link(meetup.name)

    expect(page).to have_content("Log In")
  end
end
