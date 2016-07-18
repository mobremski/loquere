require "rails_helper"

feature "user deletes a meetup" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:meetup) { FactoryGirl.create(:meetup, user_id: user.id) }

  scenario "User deletes a meetup from the meetup edit page" do
    sign_in

    visit meetup_path(meetup)
    click_link "Delete Meetup"

    expect(page).to have_content "Meetup deleted!"
    expect(page).to have_current_path meetups_path
    expect(page).not_to have_content meetup.name
  end

  scenario "user unsuccessfully deletes another user's meetup" do
    user2 = FactoryGirl.create(:user)

    visit meetups_path
    click_link "Sign In"
    fill_in "Email", with: user2.email
    fill_in "Password", with: user2.password
    click_button "Log in"

    visit meetup_path(meetup)
    expect(page).not_to have_content "Edit Meetup"
  end
end
