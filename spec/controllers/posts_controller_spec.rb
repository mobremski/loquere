require "rails_helper"

RSpec.describe Api::PostsController, type: :controller do
describe "Post API" do
  before do
    @user = FactoryGirl.create(:user)
    allow(controller).to receive(:current_user).and_return(@user)
    @meetup = FactoryGirl.create(:meetup, user: @user)
    @post = FactoryGirl.create(:post, user: @user, meetup: @meetup)
  end

    it 'gets lists' do
      get :index, meetup_id: @meetup.id
      json = JSON.parse(response.body)
      expect(response).to be_success
      expect(json['posts'].length).to eq(1)
    end

    it "posts posts" do
      post :create, meetup_id: @post.meetup_id, post: {body: @post.body, meetup_id: @post.meetup_id, user_id: @post.user_id}
      json = JSON.parse(response.body)
      expect(response).to be_success
      expect(json['post']['body']).to eq(@post.body)
    end

    it "deletes a post" do
      delete :destroy, meetup_id: @post.meetup_id, id: @post.id
      json = JSON.parse(response.body)
      binding.pry
      expect(response).to be_success
      expect(json['posts']).to eq(nil)
    end
  end
end
