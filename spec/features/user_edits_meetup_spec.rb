require "rails_helper"

feature "user edits a meetup" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:meetup) { FactoryGirl.create(:meetup, user_id: user.id) }

  scenario "user succesffully edits a meetup from the meetup show page" do
    sign_in

    visit meetup_path(meetup)
    click_link "Edit Meetup"
    expect(page).to have_current_path edit_meetup_path(meetup)

    fill_in "Name", with: "this is a test"
    click_button "Update Meetup"

    expect(page).to have_current_path meetup_path(meetup)
    expect(page).to have_content("this is a test")
  end

  scenario "user unsuccessfully tries to edit another user's meetup" do
    user2 = FactoryGirl.create(:user)

    visit meetups_path
    click_link "Sign In"
    fill_in "Email", with: user2.email
    fill_in "Password", with: user2.password
    click_button "Log in"

    visit meetup_path(meetup)
    expect(page).not_to have_content "Edit Meetup"
  end

  scenario "user enters invalid information while trying to edit a meetup" do
    sign_in

    visit edit_meetup_path(meetup)

    fill_in "Name", with: ""
    fill_in "Address", with: ""
    fill_in "City", with: ""
    fill_in "State", with: ""
    fill_in "Zip", with: ""
    fill_in "Date", with: ""
    fill_in "Time", with: ""
    fill_in "Language", with: ""
    fill_in "Description", with: ""


    click_button("Update Meetup")

    expect(current_path).to eq(meetup_path(meetup))

    expect(page).to have_content("Name can't be blank")
    expect(page).to have_content("Address can't be blank")
    expect(page).to have_content("City can't be blank")
    expect(page).to have_content("State can't be blank")
    expect(page).to have_content("Zip can't be blank")
    expect(page).to have_content("Zip is the wrong length")
    expect(page).to have_content("Zip is not a number")
    expect(page).to have_content("Date can't be blank")
    expect(page).to have_content("Time can't be blank")
    expect(page).to have_content("Language can't be blank")
    expect(page).to have_content("Description can't be blank")
    expect(page).not_to have_content("Meetup successfully updated!")
  end
end
