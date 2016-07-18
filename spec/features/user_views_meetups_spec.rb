require 'rails_helper'

feature "user sees a list of meetups" do
  let!(:user) { FactoryGirl.create(:user) }

  let!(:einBierBitte) do
    FactoryGirl.create(:meetup, user_id: user.id, name: "Ein Bier Bitte")
  end

  let!(:nousParlons) do
    FactoryGirl.create(:meetup, user_id: user.id, name: "Nous Parlons")
  end

  scenario "user visits root path and sees list of meetups" do
    visit meetups_path

    expect(page).to have_content(einBierBitte.name)
    expect(page).to have_content(nousParlons.name)
  end

  scenario "user signs in and sees a button to add meetups" do
    visit meetups_path

    click_link "Sign In"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"

    expect(page).to have_link einBierBitte.name
    expect(page).to have_link nousParlons.name

    first(:link, "Add New Meetup").click

    expect(page).to have_content "Add a Meetup"
  end

  scenario "adds meetup and is redirected to that meetup's show page" do
    visit meetups_path
    sign_in

    click_link "Ein Bier Bitte"

    expect(page).to have_current_path(meetup_path(einBierBitte))
  end
end
