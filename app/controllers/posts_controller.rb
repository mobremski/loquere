class PostsController < ApplicationController
  before_action :authenticate_user!
  def index
    @meetup = Meetup.find(params[:meetup_id])
    @posts = @meetup.posts
  end
  
  def new
    @meetup = Meetup.find(params[:meetup_id])
    @post = Post.new
  end

  def create
    @meetup = Meetup.find(params[:meetup_id])
    @post = Post.new(post_params)
    @post.meetup = @meetup
    @post.user = current_user
    if @post.save
      flash[:notice] = "Post added successfully"
      redirect_to meetup_path(@meetup)
    else
      flash.now[:error] = @post.errors.full_messages.join(", ")
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @meetup = Meetup.find(params[:meetup_id])
    @post.destroy
    flash[:notice] = "Post deleted!"
    redirect_to meetup_path(@meetup)
  end

  private

  def post_params
    params.require(:post).permit(:body, :user_id, :meetup_id)
  end
end
