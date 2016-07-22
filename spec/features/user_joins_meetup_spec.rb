require "rails_helper"
require "spec_helper"

feature "User joins a meetup", js:true do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:meetup) { FactoryGirl.create(:meetup, user_id: user.id) }

  scenario "User visits meetup's show page and clicks the join button", js: true do
    visit root_path
    click_link "Sign In"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"

    click_link(meetup.name)
    expect(page).to have_button("Join")

    click_button "Join"
    expect(page).to have_content(user.screen_name)
    expect(page).to have_button("Leave")
  end

  scenario "User visits show page and clicks the leave button", js: true do
    sign_in
    click_link(meetup.name)

    click_button "Join"

    expect(page).to have_content(user.screen_name)
    expect(page).to have_button("Leave")

    click_button "Leave"
    expect(page).not_to have_content(user.screen_name)
    expect(page).to have_button("Join")
  end
end
