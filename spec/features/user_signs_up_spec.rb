require 'rails_helper'

feature 'User signs up for an account' do
  scenario 'User fills in a valid form' do
    visit meetups_path
    click_link 'Sign Up'

    expect(current_path).to eq("/users/sign_up")
    fill_in 'First name', with: 'Jon'
    fill_in 'Last name', with: 'Smith'
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    fill_in 'Location', with: 'Boston, MA'
    fill_in 'Language', with: 'Spanish'
    fill_in 'Screen name', with: 'figaro'
    click_button 'Sign up'

    expect(page).to have_content("You have signed up successfully")
    expect(page).to have_content("Sign Out")
  end

  scenario 'required information not supplied' do
    visit meetups_path
    click_link 'Sign Up'
    click_button 'Sign up'

    expect(current_path).to eq("/users")
    expect(page).to have_content("Email can't be blank")
    expect(page).to have_content("Password can't be blank")
    expect(page).to have_content("First name can't be blank")
    expect(page).to have_content("Last name can't be blank")
    expect(page).to have_content("Language can't be blank")
    expect(page).to have_content("Location can't be blank")
    expect(page).to have_content("Screen name can't be blank")
  end

  scenario 'password confirmation does not match password' do
    visit root_path
    click_link 'Sign Up'
    fill_in 'First name', with: 'Jon'
    fill_in 'Last name', with: 'Smith'
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password1'
    click_button 'Sign up'

    expect(current_path).to eq("/users")
    expect(page).to have_content("Password confirmation doesn't match Password")
  end

  scenario 'password is too short' do
    visit root_path
    click_link 'Sign Up'
    fill_in 'First name', with: 'Jon'
    fill_in 'Last name', with: 'Smith'
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'pass'
    fill_in 'Password confirmation', with: 'pass'
    click_button 'Sign up'

    expect(current_path).to eq("/users")
    expect(page).to have_content("Password is too short")
  end
end
