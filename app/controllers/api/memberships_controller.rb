class Api::MembershipsController < ApiController
  def index
    meetup = Meetup.find(params[:meetup_id])
    users = meetup.users
    render json: { users: users }, status: :ok
  end

  def create
    meetup = Meetup.find(params[:meetup_id])
    membership = Membership.new(meetup_id: params[:meetup_id],
      user_id: params[:user_id])
    user = membership.user
    if membership.save
      render json: { user: user, membership_current: membership.id },
        status: :created
    else
      render json: { errors: user.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    membership = Membership.find(params[:id])
    user = membership.user
    membership.destroy
    render json: { user: user.id }
  end
end
