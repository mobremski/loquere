require "rails_helper"

feature "User searches for meetups from the index page" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:meetup) { FactoryGirl.create(:meetup, user_id: user.id) }
  let!(:meetup2) {
    FactoryGirl.create(
    :meetup,
    user_id: user.id,
    name: "Nous Parlons",
    location_name: "test",
    address: "test",
    city: "test",
    state: "test",
    zip: "99999",
    language: "French",
    description: "test",
    date: "9/13/17",
    time: "8pm"
    )
  }

  scenario "User enters a meetup's name and sees that meetup listed" do
    sign_in
    fill_in "query", with: meetup.name
    click_on("Search")

    expect(page).to have_content(meetup.name)
    expect(page).not_to have_content(meetup2.name)
  end

  scenario "User enters a meetup's location and sees that meetup listed" do
    sign_in
    fill_in "query", with: meetup.location_name
    click_on("Search")

    expect(page).to have_content(meetup.name)
    expect(page).not_to have_content(meetup2.name)
  end

  scenario "User enters a meetup's address and sees that meetup listed" do
    sign_in
    fill_in "query", with: meetup.address
    click_on("Search")

    expect(page).to have_content(meetup.name)
    expect(page).not_to have_content(meetup2.name)
  end

  scenario "User enters a meetup's city and sees that meetup listed" do
    sign_in
    fill_in "query", with: meetup.city
    click_on("Search")

    expect(page).to have_content(meetup.name)
    expect(page).not_to have_content(meetup2.name)
  end

  scenario "User enters a meetup's state and sees that meetup listed" do
    sign_in
    fill_in "query", with: meetup.state
    click_on("Search")

    expect(page).to have_content(meetup.name)
    expect(page).not_to have_content(meetup2.name)
  end

  scenario "User enters a meetup's zip and sees that meetup listed" do
    sign_in
    fill_in "query", with: meetup.zip
    click_on("Search")

    expect(page).to have_content(meetup.name)
    expect(page).not_to have_content(meetup2.name)
  end

  scenario "User enters a meetup's language and sees that meetup listed" do
    sign_in
    fill_in "query", with: meetup.language
    click_on("Search")

    expect(page).to have_content(meetup.name)
    expect(page).not_to have_content(meetup2.name)
  end

  scenario "User enters a meetup's date and sees that meetup listed" do
    sign_in
    fill_in "query", with: meetup.date
    click_on("Search")

    expect(page).to have_content(meetup.name)
    expect(page).not_to have_content(meetup2.name)
  end

  scenario "User enters a meetup's time and sees that meetup listed" do
    sign_in
    fill_in "query", with: meetup.time
    click_on("Search")

    expect(page).to have_content(meetup.name)
    expect(page).not_to have_content(meetup2.name)
  end

  scenario "User enters a meetup's description and sees that meetup listed" do
    sign_in
    fill_in "query", with: meetup.description
    click_on("Search")

    expect(page).to have_content(meetup.name)
    expect(page).not_to have_content(meetup2.name)
  end

  scenario "User does not enter a query and sees all shops" do
    sign_in
    click_on("Search")

    expect(page).to have_content(meetup.name)
    expect(page).to have_content(meetup2.name)
  end
end
