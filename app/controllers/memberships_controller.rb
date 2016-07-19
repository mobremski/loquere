class MembershipsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def new
    @meetup = Meetup.find(params[:meetup_id])
    @membership = Membership.new
  end

  def create
    @meetup = Meetup.find(params[:meetup_id])
    @membership = Membership.new(meetup_id: params[:meetup_id], user_id: current_user.id)
    @membership.save
    redirect_to meetup_path(@meetup)
  end

  def destroy
    @meetup = Meetup.find(params[:meetup_id])
    @membership = Membership.find(params[:id])
    @membership.destroy
    redirect_to meetup_path(@meetup)
  end
end
