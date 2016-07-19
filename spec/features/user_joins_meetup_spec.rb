require "rails_helper"

feature "User joins a meetup" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:meetup) { FactoryGirl.create(:meetup, user_id: user.id) }

  scenario "User visits meetup's show page and clicks the join button" do
    sign_in
    click_link(meetup.name)
    expect(page).to have_button("Join")
    click_button "Join"
    expect(page).to have_content(user.first_name)
    expect(page).to have_button("Leave")
  end

  scenario "User visits meetup's show page and clicks the leave button" do
    sign_in
    click_link(meetup.name)

    click_button "Join"

    expect(page).to have_content(user.first_name)
    expect(page).to have_button("Leave")

    click_button "Leave"
    expect(page).not_to have_content(user.first_name)
    expect(page).to have_button("Join")
  end
end
