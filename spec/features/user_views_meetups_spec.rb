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
    sign_in

    expect(page).to have_content(einBierBitte.name)
    expect(page).to have_content(nousParlons.name)
  end

  scenario "user signs in and sees a button to add meetups" do
    sign_in

    expect(page).to have_link einBierBitte.name
    expect(page).to have_link nousParlons.name

    first(:link, "Add an Event").click

    expect(page).to have_content "Add an Event Location"
  end

  scenario "adds meetup and is redirected to that meetup's show page" do
    sign_in

    click_link "Ein Bier Bitte"

    expect(page).to have_current_path(meetup_path(einBierBitte))
  end
end
