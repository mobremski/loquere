class MeetupsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
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
      flash[:notice] = "Meetup added successfully!"
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
    if current_user
      @membership_current_array = Membership.where(
        user_id: current_user.id).where(meetup_id: params[:id])
      @membership_current = @membership_current_array[0]
    end
    if @membership_current
      @current_member = @membership_current.user_id
    end
  end

  def edit
  @meetup = Meetup.find(params[:id])
  end

  def update
    @meetup = Meetup.find(params[:id])
    if @meetup.update_attributes(meetup_params)
      flash[:notice] = "Meetup updated!"
      redirect_to meetup_path(@meetup)
    else
      flash.now[:error] = @meetup.errors.full_messages.join(', ')
      render :edit
    end
  end

  def destroy
    @meetup = Meetup.find(params[:id])
    @meetup.destroy
    flash[:notice] = "Meetup deleted!"
    redirect_to meetups_path
  end

  def meetup_params
    params.require(:meetup).permit(
      :name, :location_name, :address,
      :city, :state, :zip, :date, :time,
      :language, :description)
  end
end
