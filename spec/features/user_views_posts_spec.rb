require 'rails_helper'

feature "user sees a list of posts and adds to it" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:meetup) { FactoryGirl.create(:meetup, user_id: user.id) }
  let!(:post) do
    FactoryGirl.create(
      :post,
      meetup_id: meetup.id,
      user_id: user.id,
      body: "test")
  end

  scenario "user visits showpage and sees a list of posts", js: true do
    sign_in
    click_link(meetup.name)

    expect(page).to have_content(post.body)
  end
end
