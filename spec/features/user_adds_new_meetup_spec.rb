require 'rails_helper'

feature "users can add meetups" do
  let!(:user) { FactoryGirl.create(:user) }

  scenario "user adds new meetup successfully" do
    sign_in

    expect(page).to have_content "Add a Meetup"
    click_link "Add a Meetup"

    fill_in "Name", with: "Nous Parlons"
    fill_in "Location Name", with: "Jacob Wirth's"
    fill_in "Address", with: "33 Harrison Ave"
    fill_in "City", with: "Boston"
    fill_in "State", with: "Massachusetts"
    fill_in "Zip", with: "02111"
    fill_in "Description", with: "Joie de vivre!"
    fill_in "Language", with: "French"
    fill_in "Date", with: "January 13, 2017"
    fill_in "Time", with: "8pm"

    click_button "Create Meetup"

    expect(page).to have_content "Meetup added successfully"
    expect(page).to have_content "Nous Parlons"
    expect(page).to have_content "Joie de vivre!"
    expect(page).to have_content "French"
    expect(page).to have_content "January 13, 2017"
    expect(page).to have_content "Jacob Wirth's"

  end

  scenario "user does not provide proper information for a meetup" do
    sign_in
    click_link "Add a Meetup"

    click_button "Create Meetup"
    expect(page).to have_content "Name can't be blank"
    expect(page).to have_content "Location name can't be blank"
    expect(page).to have_content "Address can't be blank"
    expect(page).to have_content "City can't be blank"
    expect(page).to have_content "State can't be blank"
    expect(page).to have_content "Zip can't be blank"
    expect(page).to have_content "Zip is the wrong length (should be 5 characters)"
    expect(page).to have_content "Zip is not a number"
    expect(page).to have_content "Description can't be blank"
    expect(page).to have_content "Language can't be blank"
    expect(page).to have_content "Date can't be blank"
    expect(page).to have_content "Time can't be blank"
  end
end
