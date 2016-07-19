require 'rails_helper'

feature "edit a meetup" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:meetup) { FactoryGirl.create(:meetup, user_id: user.id) }

  scenario "owner-user sees an edit link on the page" do
    sign_in
    visit meetup_path(meetup)
    expect(page).to have_link("Edit Meetup")
  end

  scenario "user clicks on the edit link and sees pre-filled form" do
    sign_in
    visit meetup_path(meetup)
    click_link("Edit Meetup")

    expect(current_path).to eq(edit_meetup_path(meetup))
    expect(find("#meetup_name").value).to eq(meetup.name)
    expect(find("#meetup_location_name").value).to eq(meetup.location_name)
    expect(find("#meetup_address").value).to eq(meetup.address)
    expect(find("#meetup_city").value).to eq(meetup.city)
    expect(find("#meetup_state").value).to eq(meetup.state)
    expect(find("#meetup_zip").value).to eq(meetup.zip)
    expect(find("#meetup_language").value).to eq(meetup.language)
    expect(find("#meetup_date").value).to eq(meetup.date)
    expect(find("#meetup_time").value).to eq(meetup.time)
    expect(find("#meetup_description").value).to eq(meetup.description)
  end

  scenario "user updates meetup successfully" do
    sign_in
    visit edit_meetup_path(meetup)

    fill_in("Name", with: "#{meetup.name} updated")
    fill_in("Location Name", with: "#{meetup.location_name} updated")
    fill_in("Address", with: "#{meetup.address} updated")
    fill_in("City", with: "#{meetup.city} updated")
    fill_in("State", with: "#{meetup.state} updated")
    fill_in("Zip", with: "12345")
    fill_in("Language", with: "#{meetup.language} updated")
    fill_in("Date", with: "#{meetup.date} updated")
    fill_in("Time", with: "#{meetup.time} updated")
    fill_in("Description", with: "#{meetup.description} updated")

    click_button("Update Meetup")


    expect(current_path).to eq(meetup_path(meetup))
    expect(page).to have_content("Meetup updated!")
  end

  scenario "user enters invalid information" do
    sign_in
    visit edit_meetup_path(meetup)

    fill_in("Name", with: "")
    fill_in("Location Name", with: "")
    fill_in("Date", with: "")
    fill_in("Time", with: "")
    fill_in("Address", with: "")
    fill_in("City", with: "")
    fill_in("State", with: "")
    fill_in("Zip", with: "")
    fill_in("Language", with: "")
    fill_in("Description", with: "")

    click_button("Update Meetup")

    expect(current_path).to eq(meetup_path(meetup))

    expect(page).to have_content("Name can't be blank")
    expect(page).to have_content("Location name can't be blank")
    expect(page).to have_content("Address can't be blank")
    expect(page).to have_content("City can't be blank")
    expect(page).to have_content("State can't be blank")
    expect(page).to have_content("Zip can't be blank")
    expect(page).to have_content("Zip is the wrong length")
    expect(page).to have_content("Zip is not a number")
    expect(page).to have_content("Language can't be blank")
    expect(page).to have_content("Date can't be blank")
    expect(page).to have_content("Time can't be blank")
    expect(page).to have_content("Description can't be blank")
    expect(page).not_to have_content("Meetup updated!")
  end
end
