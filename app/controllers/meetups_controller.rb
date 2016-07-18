class MeetupsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    @meetups = Meetup.search(params[:query])
    @meetup = Meetup.new
  end

  def new
    @meetup = Meetup.new
  end

  def create
    @meetup = Meetup.new(meetup_params)
    @meetup.user_id = current_user.id
    if @meetup.save
      flash[:notice] = "meetup added successfully"
      redirect_to meetup_path(@meetup)
    else
      flash.now[:error] = @meetup.errors.full_messages.join(', ')
      render :new
    end
  end

  def show
    @meetup = Meetup.find(params[:id])
    @membership = Membership.new
    @users = @meetup.users
    @membership_current_array = Membership.where(user_id: current_user.id).where(meetup_id: params[:id])
    @membership_current = @membership_current_array[0]
  end
end
